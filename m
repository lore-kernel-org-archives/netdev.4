Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795505349;
	b=0O0FTeK9DStMC/uv0CmExdqAYigkiaNqfC4ls2xwjhgm2eBBs1vJt06Ql1GG1KuFwh4d
	 Qrlzhm6j7d5EDccfVnIBRoUoRKI7Bm8ODVJ/CPXh/WwXqumoQCLvg5HG0l5Ck1PmE5cPK
	 +6HA2truBQkVB4qYMqMYaYWzLVl/otLbe13hFjX1sixpNxs5heyKhmFpCwqnnccZgu6vH
	 M6YfFr/3BGanay1q9vqp3wPqhXI69FoiTkLfKI1VV1sNBF/Ve0aSJSimVfgQcs5ohL2Qx
	 BNVP2P6+DWTC8gN1MMsYaCw7enjnFR2DZSmWZaV73NpGRPnaU92ToVNLlon10fNAqPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795505349;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=i5K60fmvwEmavzV2HbQ6y0ufvklNifD+2bmJJtU7uFY=;
	b=4BgC5ddHrDf657yqGtTo886qgcJ6BGR+TjBAJorjCBuEnxpNJYRjS5RJRAZ3D9aRjXqO
	 MkrCRiGPWX3cOIwHfLO8lnVCTlv0DCf/5RIiKOcZC68Z9V79QHV87cLr3LqpCqWqRztZa
	 5Jh8itwY0sERJ8y+DdMoX6f/waPiwLL6B9UBtiLDm/IlyyfWRmW+hvErlIkRqnf3otp0R
	 L6dJ/3+iBkrOWXPPKxKJxtJe00ALaKfKJPlOX8pgtPUTOy+XdeNuarVUWmUxtXPl9y1cA
	 MNRwsfuqvl+SNMrhW/WkSJZMcKIKg2XMYxIRLOFZwpPc1QoOk9aToQ9rhUJa+dWuTLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IplZS4yt;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181B2606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 07:29:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 181B2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IplZS4yt
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cdb75699c7cso1598662a12.2
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 23:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795505348; x=1796110148; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i5K60fmvwEmavzV2HbQ6y0ufvklNifD+2bmJJtU7uFY=;
        b=IplZS4yt7iFWiBqF1sGzXXNr28tAyTBxelnjRoW/R38BsaGGufHVy2e+F1z78g1RLO
         SE3BbI6T10JIDGX4rET1dFhR+52jdiJiYlG8cdqGx2jDUGpesVM5XyqZKQ5MgeSiACpV
         vc2MeTpHte4eAE8DJxKn9bvqUOFpNfMb9VqvsNC/iJ3NYFFIXS0BsJyaXaijg7f8fqYB
         mNsWDyUj/66KHjAJ/SOW4uLZVULMi73UQ8xEm9UR4Oj19QjPkpo0BnJ8npx3OrqoqK/h
         mIQ9vagSqrPiY2tkm+ax321dapyNyZ09Ifboz2Sfqv7x+qPy8PvcE8EafAs8AFkXbr0r
         WmTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795505348; x=1796110148;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i5K60fmvwEmavzV2HbQ6y0ufvklNifD+2bmJJtU7uFY=;
        b=oTcXqGeImu/MWQYZWtVbgqpm43Lsnjay/1z8TDBEdM7AcopslsE2srJPq+brikTxoj
         SkyYKorQYrJf43OFK7Yr1D/+3wVMRqGze50X/Ng/rygkuW1RnKIE+/SCVqxlpuKbHeZd
         T+5xLKRSNjU4pdQv0lOmZBzIq3LuWDvACQiz1ceIjZ/+h8XXPVHFbwkcUglfn7qLxSj5
         i5hCkmMc3AwB2VTmNpUhuqz2YoI+D7GnTPqDW1BgT1DVHAabT5tWllqr8/gDbVaf4+hz
         hAHRog9pqzuEflrZKDyeUYS2bySQV2IN/eUlsKbW1mNP1TsHQ/6HDlpY2BEBiZNSd0Ki
         CIhA==
X-Forwarded-Encrypted: i=1; AL+hErEQ+lP31JyyeuvjzmGIci1OWWzb67j3T2liAKRU/GNzKcfDTtav8Dh62LdVI+iJrFRxewK7kyE=@vger.kernel.org
X-Gm-Message-State: APuU4Z98fHrc1I0giT5cesRaDE7KVEnwAUU3Xg4oOTodci7p/ogEsFEF
	uPs2zYPLcw2qFGQ0jhzaLRFSDw6XgLihMESNgeSXkAJgv4e0wqFb1eqw
X-Gm-Gg: AZFdTZfSh73Bm/CQbFrOjnkwUmFGEIBRow3QLtaaHeoaZYtJppKOG+2FluYRnuVvb04
	DkRP8C9ZqILwnGO61j8p6ZaEIiDoggK/mBLfmYuxDprukt5ZQmYfJVXqsXVi1D4nAvcLP6OwjVa
	zUrXs353hlyhu3N1BzpSIhRk5SSYfzsRE1Qv8Kv9gYHkSDmFh34rahoEF1eu1nLHj8ZFUs87OLS
	g+LvWxepmGRcD591WzqPuT5b0OQsZ0MzsMv9u56bst4MA15aL8WhQXsrKcgNSsVbhlTX/kg30sV
	W+QGq1IPjfxvEfx7KjJg8UQ2GSLV5r34Kd4CRGGog72hCoypdJuGFo5lzMwGY86Q+TJBMfrzfxn
	48S/xlmhlBY6v9bib7TCO9gx2GsC2UKsTW1XCoSBNlnTQGhK5hvYN6PhG6hwJ3IjK4QWtB/RdAm
	hWkigWNTP5dIr7NQp3gslxyUnxubtxVQJykttIgLLVv0FExRxf6iwiCSS0Nm8eIKRpKWOztI8ZS
	iUWQrrAueXjOxmgthbin0iBMdPNOKujMCq+Mfdx9rpG8ORHj5sVf85hJ8KJo1Ar7Qf9DNZNHhUy
	d1hWkLfA+/WwCJZZeAx96YgQlH0pCm0PPSDYo6irbRGW3CLNdftngMqPHCp85lQIednve7P0g0N
	jrq3qUhlEu37lmZJJtUwaDLcD+ICZcNUOIjGD
X-Received: by 2002:a05:6a21:4cc7:b0:3dd:85aa:4524 with SMTP id adf61e73a8af0-4014b56547dmr13760885637.31.1795505348209;
        Mon, 23 Nov 2026 23:29:08 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([43.224.245.233])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfe9bb9sm6296177a12.12.2026.11.23.23.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:29:07 -0800 (PST)
From: Qican Ma <goonsomeway@gmail.com>
To: dust.li@linux.alibaba.com, alibuda@linux.alibaba.com,
 sidraya@linux.ibm.com, mjambigi@linux.ibm.com
Cc: tonylu@linux.alibaba.com, guwen@linux.alibaba.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 linux-rdma@vger.kernel.org, linux-s390@vger.kernel.org,
 netdev@vger.kernel.org
Subject:
 Re: [PATCH net] net/smc: serialize clcsock release against CDC receive path
Date: Tue, 24 Nov 2026 15:29:02 +0800
Message-ID: <179550534286.21006.10155127387498208795@gmail.com>
In-Reply-To: <awURtCvesMgSBQY2@linux.alibaba.com>
References:
 <CA+OT+OPkNsk2QHczVmb6KVJ+z_1tpH9DXm8JmACc5E6x-YFwPA@mail.gmail.com>
 <awURtCvesMgSBQY2@linux.alibaba.com>
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

Hi Dust,

Apologies for the trouble - our v1 mail had the 95-char hunk header on
smc_cdc_msg_recv() line-wrapped by the Gmail HTTP gateway.

Note that this clcsock release vs CDC receive race is an independent
issue from Bryam Vargas's CDC cursor bounds series, and I have verified
that it applies cleanly with zero conflicts both directly on net/main
(4392bb809812) and on top of his 6-patch v9 series.

I am sending a clean [PATCH net v2] via direct SMTP right away.

Best regards,
Qican Ma
