Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795303388;
	b=orNY2NfOyR8ReWQjIJbK9jf0T65lC2UAPbICPPpfa9hzIWC1i1A+HMaL/FnwqWdMqsGL
	 A0F56zB57FieX/Ox3j/FxpavNBeWAw5ToT0QxxvWB1bvPbffnhjyljDAf+iWNoaeha+4T
	 HCeM0PJujbi4FOITRPWtSDOUkZEZzToN49jxpITP4gWgkIaC2FL4vpeEY8NIsRhd0XXFO
	 Ztv+jsO4B+NbOE/+o0j3rXa8ClB1BS9JsVG4DABDQnWkjK07b0UpN8DBr1CGcEO7Acwzc
	 mkrGvHx5kBwCf4/Wpz+69pkx6YnXnE1QL7QcLxrghGc3weHY1vwLwrtG/QUFYRX8ynw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795303388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=ba77b/jATW5nlg04vnMEH6drY3g3rHbS+CB/0TJgvrQ=;
	b=yvE65qyQa1FRZM9zowszw0ZzhbBeOGmRmCF5XbXwSC2C1jM23bkE8Yil/G7YF0XpZ+3U
	 DIvL9JhKa1++nBSVR6T8T98YeSi9QDCxRBNQcumQaf5Zn2sKFh9Vaolo14zailYryzeTO
	 bHTgK7PB5RRCbrz51dAMFcHPh7XakeVA/DSK/wtKVBWd5jphe1vXys14CuElhTM3F9GZF
	 F62EJzO/QTYq2jM6Xv9KIgPffEmODQ/TwB2B6IoSEOIBywoZdAx3ulGrEhnvtzhvWfxN8
	 q/kqILEBIDSyfoBM94Qgv4MmtCBL2o2UjbU/6exE82+FYXujsQ6E+oQnt9aMHrpXFQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A5ADXXyK;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9854606A320
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 23:23:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9854606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A5ADXXyK
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b3acec6677so3001285c88.1
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 15:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795303387; x=1795908187; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ba77b/jATW5nlg04vnMEH6drY3g3rHbS+CB/0TJgvrQ=;
        b=A5ADXXyKNNxRYKinyv2jfb2jofONVA6wHH2cuK3oBS0xJHx2kIiCRerB4hGRKQO8ej
         K1isKJ/bp27NmQpSdB42gYYm5aGnxUg7yqYmJZo0iFUTh3zDXQhBXthkUEDNaNv0wgvY
         srSPm7+FO2vBdbP1nUbg6M8jv3cAj2sqw99AF2bSMhQYDB5dzsUYA1fuoc2Ou0Z4wZiS
         tsmy2X1Mb6YcIlW0CjV86b/rjsF+POB5I+y4h6aK/r+jSM+m6sCmsYYfgxALj3LX6Xgl
         /1jinmilmZSTHl8n2EwCCVAafOubF0b9KLfSTdQ+FS7ldlMRGPJhfEYQcYIyNq4WsZiy
         JbVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795303387; x=1795908187;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ba77b/jATW5nlg04vnMEH6drY3g3rHbS+CB/0TJgvrQ=;
        b=WPsxoBp6qVhPnFg+Eo6cLqFQ98j+kkrkoczrcFR5u4coeSdBAmVSpjbyjNhtR8wcHZ
         dUB7w+EoVRX5BDlPWRUVIIXLqvtMmmQ9g4F9lK6pw93WxS9Ia1IQC4rvXtme8WecBj1W
         MZGIHuCySTRO3sQ64JqcCeDeZFTcvQW9YmBam1QGH6EMU3KJndlyl/xtLFpO/6nznDK5
         l8JHJ1B6rMMVqGD9IaBhAuZgiPtBFoBVbAfPLC66F8BDzxYsJUxiMyh56ZnHwhbcNf/c
         6/taF2BMaw990Z7+y75K/bmnY2GLpPoBnpPpP1xHmP6wcxRNvF/Pw5KxqOPfuA8RwddQ
         GuzA==
X-Forwarded-Encrypted: i=1; AL+hErFGcxu9/CEqM9Ho8ZsQIXWzYgwlFLXyG00Kv/JcEwhNXrnz6QLg+JGKAf1wnbQmpHkcl7XlVyk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9m/wsDpB31URFLp0xMD6/0ilybgiZPxWklNZUZBkQQTKlziOl+
	nSD8PEnR+92XOPe7OhEsC+ZK3ZuXj6hvYEvpJDILZE2XAxmpu5+NrIpp
X-Gm-Gg: AZFdTZcKgBoji6bsfAA/Drvpcy8BDgdgCAPrKpXd81pHcSvAvuDG0qHRYjw9C0RMKDc
	UmmrJYo6Bk0rJ1RwzcCneQavNmQVzs0I6hUf0uq2NFb2uWNVoQkSYC2CKGzbtIervKON8r9gZCZ
	tC90tN+4T3S4aO3Ihp0Lg/gutw8OPdDDGNXcJT6OJ24WpzXxLGeXZvQhj06O8V6MvIu6IN8UHZ8
	X9giLRXSmLFEfnlWqjrWsTF/u5a25yNZ5OMqSFZF5GzSxD8GjPGRjKtW0wvpywt94CKQ3KkDbOq
	LA9vHtyi6m+XoAc0n0XdqhMcXX9MQGXo94QwGvBW9xWEbAJdYZzpER8T7C6M6spGhbcB2wp/53h
	n+3Jyp4559e91q4bobfiq3K8QzHh5UJY1CYa0+ouDNct3m4HjjwnpkMfk4/MnpUdUOLjZRJt5mh
	MrT/2X8l8GWpxYx3HJkaAkFIgNzYKP4KO6xQi5LTd2OEtv2ZLPfg2Na3aWOpt8q170sdMSUYedB
	kfBMg0EG3s6TT3jA9ZBb0YrFQpD/7M6gk6H4e/3JtgVQqx+8bLZa3jDopgRimPLLob2jEAesziR
	uuSNb8/tsZzv7qvhNCIIfGwZLLfNrw==
X-Received: by 2002:a05:693c:2181:b0:36c:b7b4:407e with SMTP id 5a478bee46e88-3856fd57eb1mr8104657eec.22.1795303386758;
        Sat, 21 Nov 2026 15:23:06 -0800 (PST)
Received: from gmail.com ([2a03:2880:9ff:6e::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm22938893eec.22.2026.11.21.15.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 15:23:06 -0800 (PST)
Date: Sat, 21 Nov 2026 15:22:20 -0800
From: Narcisa Vasile <narcisav.kernel@gmail.com>
To: Michael Chan <michael.chan@broadcom.com>
Cc: Narcisa Vasile <narcisav.kernel@gmail.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Coco Li <lixiaoyan@google.com>,
	Stanislav Fomichev <sdf@fomichev.me>, netdev@vger.kernel.org
Subject: Re: [PATCH net] eth: bnxt: split TX buffers that don't fit in a
 single BD
Message-ID: <awInrBIuavP3Z824@gmail.com>
References: <20261119223854.3050-1-narcisav.kernel@gmail.com>
 <CACKFLinsQ6xLQMN9d_ZC+gy7S1PvXp2X6AXhwsMvqAeNs8BQ6w@mail.gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACKFLinsQ6xLQMN9d_ZC+gy7S1PvXp2X6AXhwsMvqAeNs8BQ6w@mail.gmail.com>

On Fri, Nov 20, 2026 at 11:12:28AM -0800, Michael Chan wrote:
> On Thu, Nov 19, 2026 at 2:39 PM Narcisa Vasile
> <narcisav.kernel@gmail.com> wrote:
> 
> > @@ -546,8 +604,17 @@ static netdev_tx_t bnxt_start_xmit(struct sk_buff *skb, struct net_device *dev)
> >                 goto tx_kick_pending;
> >         }
> >
> > +       /* Data BDs after the long BD and the extended BD */
> > +       nr_bds = bnxt_tx_nr_data_bds(skb);
> > +       if (unlikely(nr_bds > TX_MAX_FRAGS)) {
> > +               /* bnxt_features_check() makes the stack segment these */
> > +               netdev_warn_once(dev, "SKB needs too many (%d) TX BDs, max supported is %d\n",
> > +                                nr_bds, TX_MAX_FRAGS);
> > +               goto tx_free;
> > +       }
> 
> Is this check just defensive or can it actually happen?
 
It's defensive. It's covered by the check in bnxt_features_check() for
MAX_SKB_FRAGS > 22 and can't trigger for smaller MAX_SKB_FRAGS values.
It's there in case BNXT_TX_MAX_SKB_BDS is ever wrong, so the skb is dropped
instead of the NIC getting a wrong BD count.
Would you prefer I drop it in v2?

> > @@ -90,6 +91,20 @@ struct tx_bd {
> >
> >  #define TX_MAX_FRAGS           (TX_MAX_BD_CNT - 2)
> >
> > +/* Largest length that fits in TX_BD_LEN. */
> > +#define BNXT_TX_MAX_BD_LEN     0xffff
> > +
> > +/* BD length for split buffers, a multiple of 4K so that 64K frags don't
> > + * end with a 1-byte BD.
> > + */
> > +#define BNXT_TX_SPLIT_BD_LEN   (BNXT_TX_MAX_BD_LEN & ~(SZ_4K - 1))
> > +
> 
> 1-byte BD should be fine.  Do you see better performance splitting it
> at 60K + 4K?

Only marginally. With PCIe being the bottleneck, the 0xF000 split showed slightly
higher throughput than 0xFFFF:
                   TX payload Gbps          throughput
                 0xF000      0xFFFF         difference
  1 flow         28.417      28.412         0.02% (noise)
  8 flows        28.444      28.431         +0.046% 0xF000

I used tcp_mmap with MSG_ZEROCOPY from a 2 MB hugepage and set the
MSS with tcp_mmap's -M option to keep every split buffer 4K-aligned.


