Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437534;
	b=FXyg+dbSYhowrxQzrR+d0seVfFoZySxi3BJjOMyAZ8Lsscz5u321A0hWeDY+TQGc2xFh
	 aJg37o+p6yCZwFj5wv5ILvZwp+3j9Jnen5QkhAYLH31Jl3CC9VzB5pZiKUy/AVuaoO19X
	 0KxmDfq8t0zQ6atS1tb/1xiJAmiDbg9u0eo80XL0h12pwPKUDiVThyhYjYI9VSOR8NG2n
	 KYA78SjE6cI6RAQTW1k2OvmiuI09cp8jqVqsfb5pJTItINHGgN6gKGPn/Fyzx1zmbLkZ9
	 DMME0qUzXHfubFK++XN5BmXCpdYG1aRZHRAo8fAGOwtF4iCjwwpi/e3Zr+qCambKOOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437534;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Subject:From:To:Cc:X-Mailer:References:In-Reply-To;
	bh=59RxTHGvhltoNw2gc0/13upvGG9pwIkmUmOzptR+Lb0=;
	b=v5YFbOPQ/QTQVMjm3TeaVa/CeG/zGtbELjgUf0LjHJusXx4ij+O4ht1ZJ/U8nkvxPhHE
	 CwlY6zSwKw/9ToQMA6UTF9NnwqwydOe7V/IKvgfVlPQ21lDa3ss/oFUqsf3s+vSK/eZBa
	 oSOM3cSoq42FBVCvVo4zMlojH0tscQcxgV0qxNehqntnFX57Fgu2bXioc9xZFBQ/UEiWp
	 xfSvZFFSXqlofXARzIzujqq5uP0BMAhdxQ/l1nj2mT2NRkLSgCVOzUkq3KDhslv9KV9xO
	 9PnO1MRvWsv62kjjEAbJzEZD5WSiNPOHU6zo5m5BKzuAwcAOC2LR5BdL0oFEzOGNCgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ieGbhYkm;
	arc=none smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA05606A327
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 12:38:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FA05606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ieGbhYkm
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b51389f58cso32796797b3.3
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 04:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795437533; x=1796042333; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=59RxTHGvhltoNw2gc0/13upvGG9pwIkmUmOzptR+Lb0=;
        b=ieGbhYkmA1tVgB8nYy25uSifUEyfNr8bR6537VLozGv55qw9nCYaRuq9fAxvEmCRMq
         MTqXrhD+3lp5K8wNSXipcOgFNc/jazfFRTKaErMwRbDBigni1Tb19BJY2WoKKTi0ep9s
         UjF0IVRN+sVlNPIACAkprYnZ0OvYo5JDiWaty9hcMySXmPn+ddeePMFFVt3Hhb0bwLbb
         XVSw+IGS2sDadCblffLCz7CnkDF7L4XIR89egfCjJefrxkrx6BgzEkyAcxdenqz4+GnO
         S9o3fIUHacY7saE0XJ9vYdy8r/BVcuXNE9yh3x5s4FT53/9eTtvj6SiefaVycA4XGlEl
         FmQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795437533; x=1796042333;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=59RxTHGvhltoNw2gc0/13upvGG9pwIkmUmOzptR+Lb0=;
        b=O514AOHolQLfNxnA0reJ9LCbZtyOUGBIUqk+rzCJpz6yPMYfBZ9yW0zKpYNscfrB9Y
         z37ur4ajlf2IZnSv8WVlauajeMt1S5J7w8LWc8l89qyNbwITGgqDG1kx+OlXJ4Tj8nS6
         QIPACi/J/+93N0QYiCs9NGSrh6bNgi4tBdpEuEaVwjFgZc92IrVY/puLBATTnf7jwzFC
         PpPSRcejlc+TmgVMkWOnYvru7onOg1yqa9ux2MLwbyLOduCUUwkeNyXDF2H/bVGR3uWD
         13t4zgTpVFYfYb3cylThufLXeMcRdI/JXFm3q/EQPPxKO9+PnPIkYszrIwoNWSmJEtP6
         qo/Q==
X-Forwarded-Encrypted: i=1; AL+hErFBHOd2OwolMhFi3iPK+LXKcsRVJ1uZcyeJed9C83KmAVPud/OfxIU+5dK6jE+w5ds5PSiBAKg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8uoNPjUrrSYsByywEB5hgodCi02iWE7eTWztvB5SXqjiq6yCzU
	YkZdaD1sJCg1H2B5tdo/kvJ7UJZYAjUJK5rsAPETAThkfJ915915Cp7d
X-Gm-Gg: AZFdTZdH9jEhLNH/zYpAldkmg1k7mhamycL3yp7J8TwTIm5uysfMEo749WPKMhvULid
	IY0uaDBBS4POlmEsn0G0Xaf8frmVhHc84b1kW3HrQsJ9KwldQpjjyvO5ZYR8JdC6KaY8xkwBZQ3
	OvID4j5BsASxgSj1aIsSNK5B8q+dKBWmXh1rTaLQhqiad3a5Oey+EW/RFRH0+RbcjaSw1lIIInv
	ff82dX4BcwNvBQCIACejhW3XUngUnAFOz6RvKgf3B7s7cnA/c20yFJ+2pcB+2cAteVM3W3vReJM
	65IySDOmtJwpiLehh8rz9qnE5EV+WQCobrFGeKKI4to4LVqwbyutf8rtJ5a8lUnFQMGnd9jkYI1
	Y5kXts6rUy89zeXHrhX7kjy5+jx0haevdau2sPjVYTWjrH4pQD+XbBt7gIy5dqsfwiHtSJrNzlS
	DyUeo0tjgE6b9L/crUMc50cZ/g5s7UgpDuftOfLkIzFLjg9sTAYRc/fwbCHjaffjRPWnLbe06+5
	7BeN8DBTXOKbM/2VdeD6ACbLJNpwaA0KVour28ngYH7N1bo/RVYOypfSHyCYlXHwyDG8l+N6Cmc
	37BcaRVC8Om9PiQ=
X-Received: by 2002:a05:690c:3749:b0:8a9:d5f2:f5a6 with SMTP id 00721157ae682-8b5204cd1b8mr37167077b3.67.1795437532672;
        Mon, 23 Nov 2026 04:38:52 -0800 (PST)
Received: from localhost ([2600:1700:4a51:2210::11])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5201b8cdbsm43605117b3.1.2026.11.23.04.38.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 04:38:52 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 07:38:51 -0500
Message-Id: <DN2LHJ9Y8KM2.1GHH6E9738JCS@gmail.com>
Subject: Re: [PATCH net-next v5 1/6] psp: support rx rekey operation
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: <netdev-bot+sashiko@kernel.org>, <daniel.zahka@gmail.com>
Cc: <kuba@kernel.org>, <willemdebruijn.kernel@gmail.com>,
 <davem@davemloft.net>, <edumazet@kernel.org>, <pabeni@redhat.com>,
 <horms@kernel.org>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
 <rdunlap@infradead.org>, <donald.hunter@gmail.com>,
 <andrew+netdev@lunn.ch>, <shuah@kernel.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <willemb@google.com>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261118-psp-v5-1-b9ec840e0296@gmail.com>
 <179530218118.3135.6547111851222246419@kernel.org>
In-Reply-To: <179530218118.3135.6547111851222246419@kernel.org>

On Sat Nov 21, 2026 at 6:03 PM EST, netdev-bot+sashiko wrote:
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in ca=
se
> you want to address the nit picks below when you respin.
>
> Low priority / nit picks for your consideration:
>
> - [Low] The uAPI doc for the rx-assoc op in
>   Documentation/netlink/specs/psp.yaml now reads "If the socket already=
=E2=80=A6
> - [Low] psp_assocs_key_rotated() (net/psp/psp_sock.c) now does a plain
>   read-modify-write `pas->prev_generation |=3D ~PSP_GEN_VALID_MASK` on=E2=
=80=A6
>
> --
>
> psp: support rx rekey operation
>
> This commit lets rx-assoc run on a socket that already has full PSP
> state. It creates a new psp_assoc that keeps the existing Tx state and
> gets new Rx state. The previous Rx SPI and generation are kept as a
> fallback, so packets sent by the peer before it switches keys are still
> accepted.
>
>> diff --git a/Documentation/netlink/specs/psp.yaml b/Documentation/netlin=
k/specs/psp.yaml
>> index f3266763c3253..d5713f5d1af7e 100644
>> --- a/Documentation/netlink/specs/psp.yaml
>> +++ b/Documentation/netlink/specs/psp.yaml
>> @@ -265,7 +265,9 @@ operations:
>> =20
>>      -
>>        name: rx-assoc
>> -      doc: Allocate a new Rx key + SPI pair, associate it with a socket=
.
>> +      doc: |
>> +        Allocate a new Rx key + SPI pair, associate it with a socket.
>> +        If the socket already has PSP state, rekey its Rx direction.
>
> [Severity: Low]
> Does this doc match the behaviour for every socket that has PSP state?
> psp_sock_rx_rekey() in net/psp/psp_sock.c rejects the rekey unless both
> directions are set up:
>
> 	if (!prev->tx.spi || !prev->peer_tx) {
> 		NL_SET_ERR_MSG(extack, "Socket PSP state is not fully established");
> 		return -EBUSY;
> 	}
>
> So a second rx-assoc on a socket that only has Rx state still fails with
> -EBUSY.
>
> psp.rst describes this precondition, but the YAML spec, which ynl and
> the generated docs use, does not. Should the op doc say something like
> "If the socket already has fully established PSP state, rekey its Rx
> direction."?
>
>>        attribute-set: assoc
>>        do:
>>          request:
>
> [ ... ]
>
>> diff --git a/net/psp/psp_sock.c b/net/psp/psp_sock.c
>> index f2cba3fa3a235..c1e38845f08c3 100644
>> --- a/net/psp/psp_sock.c
>> +++ b/net/psp/psp_sock.c
>
> [ ... ]
>
>> @@ -302,8 +333,21 @@ void psp_assocs_key_rotated(struct psp_dev *psd)
>>  	 */
>>  	list_for_each_entry_safe(pas, next, &psd->prev_assocs, assocs_list) {
>>  		pas->generation |=3D ~PSP_GEN_VALID_MASK;
>> +		pas->prev_generation |=3D ~PSP_GEN_VALID_MASK;
>>  		psd->stats.stales++;
>>  	}
>> +
>> +	/* Don't allow SPI from two generations ago to alias one from the
>> +	 * current generation. Rx rekeying under the same device key generatio=
n
>> +	 * is currently permitted, so skip if the previous SPI is from just on=
e
>> +	 * generation ago.
>> +	 */
>> +	list_for_each_entry(pas, &psd->active_assocs, assocs_list) {
>> +		if ((pas->rx.spi ^ pas->prev_spi) &
>> +		    cpu_to_be32(PSP_SPI_KEY_PHASE))
>> +			pas->prev_generation |=3D ~PSP_GEN_VALID_MASK;
>> +	}
>
> [Severity: Low]
> Can these plain writes to prev_generation race with the Rx datapath?
>
> These assocs are still published through sk->psp_assoc. The only lock
> held here is psd->lock, which the pre-hook of psp_nl_key_rotate_doit()
> takes.
>
> The reader in psp_pse_matches_pas() runs without psd->lock and without
> READ_ONCE():
>
> 	(pas->prev_spi && pas->prev_spi =3D=3D pse->spi &&
> 	 pas->prev_generation =3D=3D pse->generation));
>
> It is reached from paths that hold only the socket lock or RCU:
>
>   tcp_v4_do_rcv() / tcp_v6_do_rcv()
>     -> psp_sk_rx_policy_check()
>       -> __psp_sk_rx_policy_check()
>         -> psp_pse_matches_pas()
>
>   psp_twsk_rx_policy_check()  (RCU only)
>     -> __psp_sk_rx_policy_check()
>       -> psp_pse_matches_pas()
>
> So a key-rotate running while PSP packets arrive on an rx-rekeyed socket
> is an unannotated data race that KCSAN would report. The field is a u8,
> so it can't tear, and the result is unordered against the rotation in
> any case.
>
> The existing pas->generation write already works this way. This patch
> applies the same pattern to a new field that the datapath reads, and
> adds a second write site in the active_assocs loop.
>
> Would it make sense to use WRITE_ONCE() here and READ_ONCE() in
> psp_pse_matches_pas()?
>
>> +
>>  	list_splice_init(&psd->prev_assocs, &psd->stale_assocs);
>>  	list_splice_init(&psd->active_assocs, &psd->prev_assocs);

This review is the same as two revisions ago, so I'll just refer to:
https://lore.kernel.org/all/DMQOJPJ4AT7P.3DUQ9O213TZBI@gmail.com/
