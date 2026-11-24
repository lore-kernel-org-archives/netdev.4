Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795546096;
	b=UUC/TqQ0t74e96IF+f0AF/zpI+zq85HeNW84mNXuphmSa1kmRDqSHCpYEDCz7UghrQFX
	 hzpjWq3Kswze7Sczm9CBSeSC85Nyq2MMSRSFtpGhTZN9AvWzc0kA7b9IWnO730tmFVvpG
	 G66CFsLW1BQA3iXbnHpv8Ravvof1O4JpcqJdWFnn4u2DOO3FzyyYB2wvEkYoh9WNW6g8F
	 NT/aca3usr8VVZN0C/PDhnbWQ7mMidKnb0+CaqJobf3L0IwPWWD/q4HfPqMtbACMNud5V
	 AYdQ96ildbHOhA3Ro65EtaAzvy7IWsbLps5ZEFvQaRODm/7+47mQ3El7YJjmSxrvPLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795546096;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=XBzDKPy8F5atVthy1/b+yB4P2BpBTE8nfPxwYLvRUlA=;
	b=m/E/dcpb6fu320blg5gXLEFYWISelgzs832U81idlX3ei6sUIKvhfa5xBZ1jzZX/82nq
	 /gp/qnXFkl42UmVr1S9NoUZ4hQqtFJqQM5TkEYury+V4tAkTUuuIWjGRQ873KviGO+/UJ
	 MOegldak09kffkrqyqbwDRfgQWZVlSu+gmnJjLcyqyADwNpc1bYMpRDVs+Nl1JiWs+ko5
	 0mIzptj/pJmSFWPU3PwHgTOwXPQFdm+r3he4+J9abodnFfJVz6Yr5ULX0ckP5nYqGET4d
	 vHQEvLK+J+2iQ9G4Ftc6pqAj4M4GDDdZI9sk6XJfqJGAarn6m3JYD+RF45x2prztX9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=oSOHBSUB;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED5F606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 18:48:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2ED5F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=oSOHBSUB
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9FA491A17C1
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 18:48:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 72EEA601E1;
	Tue, 24 Nov 2026 18:48:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EE0A311E69B24;
	Tue, 24 Nov 2026 19:48:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795546087; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XBzDKPy8F5atVthy1/b+yB4P2BpBTE8nfPxwYLvRUlA=;
	b=oSOHBSUBxG/QjZ8d8nZY+rHMg62PZfnFkOoAyjGxNqLMJuZfCyqHI9McElp46SpNSSqaem
	Va7jzAdPY87J8Pd8Z9llt/kXToQTKuca0H9xXh609tDtMR2khrHponTR0SBDSq2IkeJOyM
	gp58odi8NrnVa8l5SuMT0D0T8MoaKq9Whd2dv+94gfcUK00vQMw1GXLFuGNvIyz3ltUw2m
	yueKJ2yhOvrmONqgECu9MD67dlg8hWVAbbXWpGe0qHwXr3d7M9HrP5EYzDsqZFt6qr6+dT
	8tXA8xkHXu30ihBBreT/Kj6iEw7jC2rfqDYBk5IzA+vc8Qeb063fIIfJr2KJzw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Lee Keon-Hyeong <leegun25@proton.me>
Cc: alex.aring@gmail.com,  stefan@datenfreihafen.org,
  linux-wpan@vger.kernel.org,  netdev@vger.kernel.org
Subject: Re: [PATCH net] mac802154: take RTNL around ASSOC RESP transmission
In-Reply-To: <20261121150835.256812-1-leegun25@proton.me> (Lee Keon-Hyeong's
	message of "Sat, 21 Nov 2026 15:08:43 +0000")
References: <20261121150835.256812-1-leegun25@proton.me>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 24 Nov 2026 19:48:06 +0100
Message-ID: <87se0qqd5l.fsf@bootlin.com>
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
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 21/11/2026 at 15:08:43 GMT, Lee Keon-Hyeong <leegun25@proton.me> wrote:

> mac802154_process_association_req() runs from the rx_mac_cmd workqueue.
> The missing RTNL was identified during an LLM-assisted code audit of the
> mac802154 association handling path.  The function builds the ASSOC RESP
> and sends it through
> mac802154_send_association_resp_locked() -> ieee802154_mlme_tx_locked(),
> which asserts the RTNL and calls ieee802154_sync_queue().  The worker does
> not hold the RTNL: this triggers an RTNL assertion failure whenever an
> ASSOC REQ reaches the response transmission path.  With panic_on_warn=3D1=
 a
> single unauthenticated frame panics the kernel, even with
> max_associations=3D0 (a rejected request still sends a response).
>
> Take the RTNL before association_lock, matching the netlink lock order
> (RTNL then association_lock), and release it after the association lock on
> all exits.
>
> Reproduced with a monitor/coordinator pair on mac802154_hwsim; the same
> test is silent with this patch.  On a CONFIG_PROVE_LOCKING kernel 86,891
> association requests were sent while the coordinator was brought down and
> up 1,200 times and recreated 71 times: no lockdep report, no hang and no
> warning, and the longest down transition took about 4 ms.  The
> panic_on_warn run (22,941 requests, 300 down/up cycles) also completed.
> There is no in-tree selftest for this path; the checks above use a
> dedicated hwsim harness.

Ok, we can definitely align on the observation but the approach may not
stand.

First let's approach the numbers. 4ms is on a locally run simulator. You
are fixing a subsystem that plays with radios. A physical IEEE802154
radio would probably bring the usual bad case to > 100ms, and worth case
would be above the 1s boundary. So taking the RTNL lock as you do it
there would no longer warn in dev mode, but might lead to a DoS.

Reviewing your patch makes me realize we do something even worse: up to
10s waiting with the RTNL when waiting for an association response (for
which we are ouselves the initiator). That is slightly less a problem
since it is not remotely triggerable like the approach you propose, but
still.

I don't remember why we *had* to take the RTNL in the mlme_tx path.

Alex, maybe you remember why?

Thanks,
Miqu=C3=A8l
