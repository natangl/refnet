// Copyright (c) 2011-2014 The Refnet Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef REFNET_QT_REFNETADDRESSVALIDATOR_H
#define REFNET_QT_REFNETADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class RefnetAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit RefnetAddressEntryValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

/** Refnet address widget validator, checks for a valid refnet address.
 */
class RefnetAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit RefnetAddressCheckValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

#endif // REFNET_QT_REFNETADDRESSVALIDATOR_H
