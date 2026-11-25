Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605912;
	b=nrhbjuZ0qzZIVRGx52mC8yts7sBeCtJNg1Mj3VHrv7RFiw0chtjGs2BigDk5IfAq56Qn
	 Avo/nj0f23/YeqDdIt3ZDvctMPWksmjdfHZV5GfPG1KQFFlwfWPZ1qsHKGT1rju5L1Ccu
	 Shb/hgwbZIuk2NnVja5Xgof8c3bHgU4hREn3kjVrXEno3n15CMzHVBN1N/d/behBAK4xG
	 BQf7e24GMXqTIzWZb5u/niTlqg7VQ0J4LQJ9I/c7wZvL/rviYn+VMADhyAhkRsIEYv7S6
	 w0SqN3BdWSlzzN8bDn3y0bK5IaZEDZrkSMxkyelADZ81pUyK/jx3f4BO+tXVoaf7Qng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=0+s9qCNUHrwBekWyNMr/g7a8rDlEXK2SoEZYGY3IV7U=;
	b=BGXtPixoZvAFS1gP/koz+MCM99Y9ZsYsDd6+KVH1iuC9inHETGKOmu3HtPYA5PbEPQCm
	 bJJkjNGPLPRpe1Wcrm7k+Ce7vvmR3WbEAlDs68DiJabDx2X7bbuI3BBKF9oDhQiRjNGsv
	 R5hulnWFRQvsCTjkSu3ylRKm2g955ooAOZMFOD5s9fQbL10BUvi7fPghFNOyRHaxnuWxB
	 AU9LCkpAzEmYitDMx/89Xw3k8Icq3m0p5X7WIP47lL7lw2t3Ve6Py1ImmU0gbRqZ9dzla
	 Jtd98hsaCGAjkq6TtI2pzX55mhzGMb/4+T2nWejFx33E+O4EsN2se4psmY5hK5Cjj6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BHvkk1oj;
	arc=none smtp.remote-ip=209.85.208.170
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0579C606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 11:25:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0579C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BHvkk1oj
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3ab30b3212aso44100151fa.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 03:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795605910; x=1796210710; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0+s9qCNUHrwBekWyNMr/g7a8rDlEXK2SoEZYGY3IV7U=;
        b=BHvkk1oj1N/Y/8xVLUVFziJRf48T+nJE0q/VVrEXN2K60+RdL5nKgLVeA+3XsY4TAU
         jIA28ewYUk1qausk+ve8RiSz4aRkkDp4d4wPbSkv1RoFytrvlEJVQw0kBXk7qNxH4RKA
         pYQ/keaOTkT2Zp5+BZs8SMJZHwt7xRy+2bL9l2z1NqcKTs5s+pg1To9u50cg5GcLjpH1
         xjYG3YUkLpdTsnsxmGljo05ebVVWSFaK4glJS8cTg1BeFUMM9fzjMvZM64mMpOJEN6Ac
         HJU5xcOa6jUohhpc6s+uKPlog0UaEoCs+xbNCRQ1+SpG+fp5JxNINHyC9SuH5AlLzNsJ
         qF0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605910; x=1796210710;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0+s9qCNUHrwBekWyNMr/g7a8rDlEXK2SoEZYGY3IV7U=;
        b=QiUxgczgRX38rLG3sGJasCjlhSRZS57hnpwe+0bZoiLoCR2ToPtZwUk7mI7Uw+qmqf
         bItzbdE8WtegxXtDQAZeNZ5WgBlFIlhhDWR6wbzOWZGuhtZD6kt6o/b+mMBQjVM/EIO2
         T4PpIDmIugVpMtf98sCGXbJfg5Cam+1OFfLsFdofKtlKoRvcWisI+HW5+lPAOkK7EPXV
         B9U6pXn9oWMX64svo+M6WB0WAcyRr+WpXFT59aeSY1sknGmTtzz1mkRec1N1TO/wPkr8
         CYxZfrf8pBuqifTYiOBlqtqOfNuYnXmpwzntQ851npGPzOIKa1TPd+9xhK7Q7PR5Lwtc
         OPNA==
X-Forwarded-Encrypted: i=1; AL+hErHfL550NbmSpJ89BahxKt4ZyLZfXTnszgq9gtKi8ODX21/5WEJCR3yPG8WYftk6xmyppQ8RC7M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7saS5EuDLGz1ry3jsyEkDx8SxAorZ5JVBwq/3KdXuOxTB54nG
	/bU0Q6XKeLcGOvPBQDTWtMJrlWr7flW+dowD+oeQUE2fdv742AAPRvXl
X-Gm-Gg: AZFdTZeKN7raat2XBQVJC6Gc3EqhAs5MeO3Ky/vM74X672x9FEzb3WiB3r5Bh7RNFoq
	h8n1OK3IVGecODLeivYzk6nAdX/okBxjjLU1pcykGAM/hYV/REfN8wqH7MS59dMQNxJVpKCfdO5
	mrj8mhxoZNsuqew0fFtTS17r0iWCEQaMoBWb3+Wc9HD4xpPLqJw5FBjbg/BAft3vukSs30F1gEr
	gsahmz/h4b1VcaZy9nYYLMRU0O+ll83AFMa/rv39QVrUKH1F5phhjjK7XQaBJxAizqB6VbqzBjW
	Sv1cli2yt/D65gx/rGVOYUmO1lL0NNUV6drUJ4HxaxIZiQ97yra4gxuUbiIIbXF5Jdst7j0+1u3
	/RX6PgE3Jghbw1A7VOYjVYNpGZJV3PjPQvrTlOKDP25njl+WHCa+k3XESDRP+EQcT3TNTTAVP4M
	De3JL/hk+oHJzj137VEvjVDZDYGuvt/qsOOboMppiyFdmBr+zq44Nwh/dTGPehynj75AqsY5lHQ
	a0BP9SNvuXa20gt7/Lt1Nphs1oBd2iSwr2Pok8ZgEFttL7uUN3B1BZG+JHV15LdNp+tE3woNQ1a
	9OCTxL/a+gjkAf1YCbGKhfme07c6VQj7X3VabHP0u8e+RDNM8va5Eg1LFcX2G7LAaf3cHz3FpdK
	N
X-Received: by 2002:a05:651c:419a:b0:3ac:8a38:130e with SMTP id 38308e7fff4ca-3ae7fa692d5mr46457601fa.21.1795605909904;
        Wed, 25 Nov 2026 03:25:09 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae804ee572sm45958281fa.10.2026.11.25.03.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:25:08 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH net-next v2 2/3] net: cortina: Add CS7542 CPU network datapath
Date: Wed, 25 Nov 2026 14:24:53 +0300
Message-ID: <179560589359.3.5378747793444153378@gmail.com>
In-Reply-To: <ef5dea6e69e0947489f4825540d0f77903960f78.camel@pengutronix.de>
References: <20261125-b4-cs7542-ethernet-v2-0-d0ea3c6eb375@gmail.com>
 <20261125-b4-cs7542-ethernet-v2-2-d0ea3c6eb375@gmail.com>
 <ef5dea6e69e0947489f4825540d0f77903960f78.camel@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Philipp,

Thanks for the review. I'll drop the RESET_CONTROLLER select and both
status loops. The provider polls each of the seven reset bits on assert
and deassert and propagates a timeout or register access error.

The individual asserts matter during teardown, when the hardware may
still own DMA buffers. For example, if the QM assertion fails, bulk
assert would release NI, FE, TM and SCH again and skip DMA and XRAM.
I'll keep trying every line and leave successful assertions in place.
Any error keeps the active DMA mappings pinned. On bring-up I can use
reset_control_bulk_deassert() for the reverse order.

The 100 us hold was a conservative delay I added during bring-up. I
don't have a documented minimum for it. Cortina's BHR4 U-Boot toggles
the global NI reset bit without a delay, but that sequence covers only
NI. I'll test probe and rebind on the Almond+ with the delay removed.

Thanks,
Fil
