/* eslint no-console: "off" */
/* global console, ScarabQueue */

/**
 * @namespace WORKAREA.webExtendAdapter
 */
WORKAREA.analytics.registerAdapter('webExtendAdapter', function () {
    'use strict';

    var pushEmarsysEvent = function(event, payload) {
            if (WORKAREA.environment.isTest || _.isUndefined(window.ScarabQueue)) {
                console.log('Emarsys is not configured or is disabled in test');
                return;
            }

            if (WORKAREA.analytics.debug) {
                console.log("Sending event to Emarsys", event, payload);
            }

            if (event === 'go') {
                ScarabQueue.push(['go']);
            } else {
                ScarabQueue.push([event, payload]);
            }
        },

        reportCart = function (items) {
            pushEmarsysEvent('cart', items);
        },

        /**
         * Returns the email address from emarsys_email cookie set in
         * email_signups_controller#create.
         * @return String
         */
        emailFromCookie = function() {
            var email = WORKAREA.cookie.read('emarsys_email');

            if (_.isNull(email)) {
                return('');
            } else {
                return(decodeURIComponent(email));
            }
        },

        setEmail = function (currentUserEmail) {
            var email = currentUserEmail || emailFromCookie();

            if (_.isEmpty(email)) { return; }

            pushEmarsysEvent('setEmail', email);
        },

        firedEventNames = function() {
            return(
                WORKAREA.analytics.events.map( function (event) {
                    return event.name;
                })
            );
        },

        sendEmailFromUser = function() {
            var firedEvents = firedEventNames(),
                eventsWithEmailPayload = [
                    'checkoutShippingView',
                    'checkoutPaymentView',
                    'checkoutOrderPlaced'
                ];

            return (_.isEmpty(_.intersection(firedEvents, eventsWithEmailPayload)));
        },

        sendGo = function() {
            pushEmarsysEvent('go');
        };

    return {
        'checkoutOrderPlaced': function (payload) {
            var orderItems = _.map(payload.items, function (item) {
                                return {
                                    'item': item.id,
                                    'price': item.price,
                                    'quantity': item.quantity
                                };
                            });

            setEmail(payload.emarsys_user_email);
            pushEmarsysEvent(
                'purchase',
                {
                    orderId: payload.id,
                    items: orderItems
                }
            );
        },

        'productView': function (payload) {
            pushEmarsysEvent('view', payload.id);
        },

        'categoryView': function (payload) {
            if (_.isUndefined(payload.emarsys_category_path)) { return; }
            pushEmarsysEvent('category', payload.emarsys_category_path);
        },

        'searchResultsView': function (payload) {
            pushEmarsysEvent('searchTerm', payload.terms);
        },

        'checkoutShippingView': function (payload) {
            setEmail(payload.emarsys_user_email);
        },

        'checkoutPaymentView': function (payload) {
            setEmail(payload.emarsys_user_email);
        },

        'pageView': function() {
            WORKAREA.currentUser.gettingUserData.done(function(user){
                if (sendEmailFromUser()) {
                    setEmail(user.email);
                }
                reportCart(user.emarsys_cart_items);
                sendGo();
            });
        }
    };
});
