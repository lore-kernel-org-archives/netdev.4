Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.79.31.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794873553;
	b=VLELEGRTm1fJkUuHlL802xzsWk+QdK4u7G368858bNukmuzv9qF0JLQuO4pDakkge/N6
	 57XwS8m2tVxLo0/TfvcuRl9RKT5jNS3Ql+Wqq1+4rTpqgorjw4CLkShZry+OyVscPdNfr
	 tveg+cP4px5fS16ripK/AltEHD66oAVwqNRNwms5Bj54r2NpqesdoMvAq+spZIPt45J0U
	 mdG7omFeIFurlqYsPDT0w7BFOUeZaAXBBfDPbmc2j/nFAg77NpDbx1NMbBT3x6v15+D+/
	 6teftVaWs12oXyZe6A/hlTnzfgk9CSXZCAA8JUCPXs2D/uNXDHY6N1o6jvO0EFPH9vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873553;
	h=DMARC-Filter:Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:X-GEOIP-COUNTRY:X-REAL-IP;
	bh=nin7jykf+1qwPlDmJuey+0ddsoOn/N4Mltgp5tKoVP4=;
	b=C/v/m1jowykCeTghLHE5K63AY/H/vjrGD8AMFC4BiACNbjoWdVd1KtEGVb5i+eqx5xMh
	 q1U39vLmuSnaeBCJHQH24h11SobR4Zl9/g7KEghGSIN59ZCSiP1g8DfVUnp8AFHFyrhno
	 cWPPH+xocNUluoyZACo7C3NTrqtDV2Tx7QVtuqUBahf+HWVWOE8U/8TVbSQhAAhDe/j2A
	 jTGnwRgEK/3KaXI08Hxa2vY7G66ly+TzUPwRjNcEtFl4PLHOj8sTwiFelCAZ22Sr5BoAk
	 JmXCKrQ48wIhZfBWwjWDePXYFKoO9yJrvWGS7/s0uUP745vwVIfYxO1e3InOZ+Gf1jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openservis.cz;
	spf=pass smtp.mailfrom=openservis.cz;
	dkim=pass header.d=openservis.cz header.i=@openservis.cz header.a=rsa-sha256 header.s=openservis header.b=AalfMdcp;
	arc=none smtp.remote-ip=80.79.31.78
Received: from s01.openservis.net (s01.openservis.net [80.79.31.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3587606A31C
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 23:59:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3587606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=openservis.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openservis.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=openservis.cz header.i=@openservis.cz header.a=rsa-sha256 header.s=openservis header.b=AalfMdcp
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(Authenticated sender: info@openservis.cz)
	by s01.openservis.net (Postfix) with ESMTPSA id D4884214
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 00:59:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=openservis.cz;
	s=openservis; t=1794873548;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=nin7jykf+1qwPlDmJuey+0ddsoOn/N4Mltgp5tKoVP4=;
	b=AalfMdcpjgwRnrXrFjIaFg/M0S2CtWwqzd/pOYOM9mGI70xKVDY45td0ap6w6rzP5gdLRo
	iywUD00KnPbY2OejY98t3VuJmROktyRF7fr96XzYhxq5PCQx+3dXq1g8VTD+nPZxqK7s/f
	uQrW793VqNVFPbKie65RhG4tnwEVH9MJgPZDKXp9aMdqjQek6OZtu4Mvw7bDOXFrbk4Q7J
	Mc0Y4w2bAhpoAgi51h0ZvS1HMg8pQDaSiCQnSJP1YescI0AJsgQg2kIGDawh/mthf0Eixf
	EVdyQPfcvElv3mg9i3NdkwuaN64NXaGFtRDMuFHqw51iYMgaEwJSmCOKm+Pw+w==
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5363316fa0cso54295251cf.3
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 15:59:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGi7D1UGL3VUuo0Cj/uGHMMtpgVhzpQQDwXIeA4VjhiDPo9Ql7K5YGwLvV55Hi0kDsZSYwWvBY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8oI7C+HS7QBcBfUGszYbOnxQFxywIRmHWo+R5IAGsH7d3lGNFJ
	q56gf3q6P51Wp4Pc/GuLlxH6x+5Q1FwG5mszxEMTl+yEo6uoKt9jXDO/CqI9z+iBjxyyNQEXYEo
	5cEghT66TDSjeMQKQkgvFvy4bkgcC5yY=
X-Received: by 2002:ac8:5f51:0:b0:535:2283:20a3 with SMTP id
 d75a77b69052e-55ac775f26bmr217181761cf.33.1794873547763; Mon, 16 Nov 2026
 15:59:07 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAFvzkdAXBNAWcHFNo6akAo63Wd8B_jvhkt=AEmuLR9fgPBEfGg@mail.gmail.com>
 <avuFkgYTcgaVISkg@strlen.de>
In-Reply-To: <avuFkgYTcgaVISkg@strlen.de>
Reply-To: info@openservis.cz
From: "OpenServis.cz" <info@openservis.cz>
Date: Tue, 17 Nov 2026 00:58:31 +0100
X-Gmail-Original-Message-ID: <CAFvzkdD-y0XZ7v1Yi8WC8uVdJhg3qDuFQRzfd5qaikc9QZn6Tg@mail.gmail.com>
X-Gm-Features: AclHuK_VQzfAeziU74sDSpTrMqHvPO1d76NDLas38q9C84hFt1lIf1I2KmLhkMY
Message-ID: <CAFvzkdD-y0XZ7v1Yi8WC8uVdJhg3qDuFQRzfd5qaikc9QZn6Tg@mail.gmail.com>
Subject: Re: [BUG] netfilter: synproxy: server ACK carries TSecr shifted
 twice, rejected by tcp_check_req() since v6.15
To: fw@strlen.de
Cc: netfilter-devel@vger.kernel.org, netdev@vger.kernel.org, 
	coreteam@netfilter.org, pablo@netfilter.org, phil@nwl.cc, edumazet@kernel.org, 
	ncardwell@google.com, kuniyu@google.com, davem@davemloft.net, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-GEOIP-COUNTRY: US
X-REAL-IP: 209.85.160.180

Florian Westphal <fw@strlen.de> wrote:
> Please try this patch:
>
> netfilter: synproxy: fix double tsoff application in server ACK TSecr

Thanks, this fixes it here, for both IPv4 and IPv6.

Mainline 141b164bbe18 (v7.4-rc3) without and with the patch, same lab
script and rules as in the report, run in a QEMU/KVM guest, iptables
v1.8.11 (nf_tables), 1000 sequential connections each. IPv6 goes to a
listener on the SYNPROXY host itself (Docker userland proxy):

- without the patch: TcpExtTSEcrRejected +1048 (IPv4) and +1016
  (IPv6), 12 and 4 connections over 0.5 s (longest 1.69 s and
  1.67 s), TcpExtTCPSynRetrans +12 and +4
- with the patch: TcpExtTSEcrRejected +0 and +0, no connection over
  0.5 s, TcpExtTCPSynRetrans +0 and +0
- capture of one IPv4 connection with the patch: backend SYN-ACK
  "TS val 153206942", ACK from SYNPROXY "TS ecr 153206942" (without
  the patch 3776466496 vs. 3257743975, i.e. tsoff added twice)

All other checks of the lab still pass.

Tested-by: Dominik Shaim Ulrich <info@openservis.cz>
