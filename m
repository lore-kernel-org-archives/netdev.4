Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794662690;
	b=WMGPgDbXX1ThEGGEtb1qKRqmedWLEoy0lWoc6pcPSjNrXIFDab8VT5gRCMjRdn8gA+qE
	 mH33mebVb6v0wrRkAkt9107D59sQLIRHO4HUmzWw4gLi5UtXWmVARVS0bUNUL1znOHIXy
	 cTD689lETNq1jAcvWn2k31s//xeB/ONIr3lVDkyljoshLTKKBXKPC9+qZhvdu4PZAazaH
	 5cCAbTG6a4Dczrl20RlBLWp4eNsuAogihsmH7gqvKD/9Wz+05LALZds5DboYLV6XcLUqj
	 IfiRdLncxm6qrFtVbGAs7WHRNKn1Gba/fAzW1matidfYy1RkCpusnOLd6FW7fgQA+Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794662690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=z+m9K+LmnCAbVYsFIIcGwp/A7IxEWTYNbeU+Gj9SixE=;
	b=0o1xB/XZryuVddyk+xLuFydoim9Ry/becJe90K+s8H8bjk5rY4ABSQSuLX8DCWQ7y+Nt
	 pZl3R7lMddes0bYw6u1JXBWyFA3or42yq7NZCidLGRfVf+F3SKO2TWAJDX9X1duB9SzpX
	 9RpDGnOvyDEsY2cQDjiKsoA+s5r9853tab19970w2Ps2zUjT6xggqiIvhjA0+7bDWqC3j
	 F1kr2cMj7M0fiPrgzbRvlViZ/FlmWWnKMnajCsMsXERApfRDfyXsQuwO5zn0nzLe2M3xU
	 TwlbtsmqHBlhEdlLgBqckAxyl0rbvzbh8Rg6ZjsOPV7QUnpE+E1TSz9f7V7c149gZmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aj9G630q;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CA8606A323
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 13:24:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95CA8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aj9G630q
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1a2af4c8d00so4048864c88.0
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 05:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794662690; x=1795267490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z+m9K+LmnCAbVYsFIIcGwp/A7IxEWTYNbeU+Gj9SixE=;
        b=aj9G630qkJTfdrV87nhfsX+A5icpTrRm6U228AgbfQKxx9Y9dWaSG0gcoqg/mq6rs8
         lmr+r7aiQCymb/GAtPQbAQulrM+V8bJMEHVtrZx95itvPovVlWB+LCdgJ8PScDLmy0NR
         put6VH4ZSNYnhm0VCg5uIS3nw/hL2+lGFD3R0WQWDzqgQYnc3GDZJSwqIOVwj1s+K/Sy
         CohvgcB2BiBMhWiyyJ7T85Qljdy5xjhjJuUvlZRkyIj/zDSgsGll7YBlByCcGLZvNYC2
         BZpJBxUnfWv/lEe9RysxqYVKEhMVeNHDBkbGAj54dmqfoHAgwjeNxkwdD2UeUH/z2+dE
         +iFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794662690; x=1795267490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z+m9K+LmnCAbVYsFIIcGwp/A7IxEWTYNbeU+Gj9SixE=;
        b=uGUa0ylezR84Ny1C6mmpDzKjpor05gSnKRVY7VkzdNNKoDQl2FVS957zDpoWqYZJbc
         iWtaO6zFPwFOZRFJ4dKTKGpZjNHCiS7rno2s84pGDMJ84O8cdfaPsJ+IN6aYEbIpZPvS
         fwETda6cK/I+GUpg9DI7byOV7Tg2HzUikZ5/01AmQ/HzgWAmgriI0gY9ZICWpHs7+5iT
         yGSCG2Av6ACBWyp/PyBQx39WseJEehAaH9yPqk1IGzRp204m99owpYv3l2FcYdfOCZIN
         1O5aJcYPUUWwXpexzfs9VdyYzzIc49+gPAHcbka0Y+djrIdRnGE9mzOzoSJoXx7/Pqcx
         tKqw==
X-Gm-Message-State: APuU4Z913IsqjMyhGe/FNcdu9alp91LAOeGHyeNNOzqxYDDWju+sxCnd
	rSP1BE1k1Z7uIzh4cU/WpyCVO/+cFz9Csxzv3FGzXPk9WCLJ+79jhhnu
X-Gm-Gg: AYBFou1z0xvaUUTqGxx9jc7x5i63oeZtcf1Tpw1FiHLroDSjSSM4o9C2dt/0qEerTsE
	PmWu+84N87eHAjJNR/LSeyJpvytS2i4uy3PdGu+ehixdnhOP+MDrf323usNxrSne9GZVHasl6Q+
	KDGITQvu9frMzzVg0pKRkbtc4AmyhBXYJmU/PKMmTgF/S0bSMpkHJ1Hfs2f4UbIB73lr6Jrs6zE
	hdMzrc/slWHDLNUcr3082tMpGSMO1exISIMvilPhLo/MpE913cYqjDaIL8tB4gs0QrOb3wWgkqt
	bNtoTy1gracIZtCvvzBxekTAgQhQhNhgz6lLPolDYnSpictwXRalFuGr1+HdoYVBhZMwRUZ8HBs
	VgqvhYHRuRFE8fctyoyjfOSWM3fbP+RkNDNsDvBngO9KGxi2KpNAXfEd+4nd3O/YNDP3p3DOPKV
	n9zkyjapcoanRcsithbk+7yYxgQRTKSEBRLggiSy11icBCvnwNAmtfb/8OZriuEdOzQ0hv7yKEc
	Kb1IScXQK/4Yfs/uW7lu8dzuAiuYfmc5B7pRExIg0+sB3cSEcrjcgcwZ16o7G7GA4lLl2/ARz/M
	ZRaN2tbyoj9O+X2VST1TDpvR8tQPsC1LNcghz7y9EMGM26Qjot6lrg==
X-Received: by 2002:a05:701b:2706:b0:1b5:126c:eb88 with SMTP id a92af1059eb24-1b5126cec12mr2504907c88.45.1794662689598;
        Sat, 14 Nov 2026 05:24:49 -0800 (PST)
Received: from umang-Inspiron-3501 ([2401:4900:1c60:38c8:74f6:e2c1:4674:3e44])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f01d68sm16312312eec.17.2026.11.14.05.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 05:24:49 -0800 (PST)
From: Umang Pokhriyal <umangpokhriyall@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowangio@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] tun: delete the flow entries of the moved queue on detach
Date: Sat, 14 Nov 2026 18:51:50 +0530
Message-ID: <20261114132237.70664-1-umangpokhriyall@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <179415734502.994134.10139593761656069984@kernel.org>
References: <20261104174240.138491-1-umangpokhriyall@gmail.com> <179415734502.994134.10139593761656069984@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 08 Nov 2026 17:02:25 +0000, netdev-bot+sashiko@kernel.org wrote:
> Can a concurrent write() still put back an entry that points at the old
> index after this delete has run?

Yes. On the write() path tun_flow_update() reads tfile->queue_index
outside any RCU section, and synchronize_net() does not wait for it.
The race predates this patch. Before the patch the entries survived
every detach. With it, only a write() that stalls across the
synchronize_net() can store the old index again.

> There are two possible fixes. One is to read tfile->queue_index and update
> e->queue_index under tun->lock. The other is to have
> tun_automq_select_queue() fall back to reciprocal_scale() when
> e->queue_index >= numqueues. Would either of these work here?

The second one covers both sequences and keeps the write() path
lockless for a known flow. It would be a separate patch for net-next,
since the race is old and has not been seen in practice.
