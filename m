Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795406946;
	b=5Tr7A3JHirkvsNfcM0gZBYXOFGqWNv3xOChjWxs3WBKsQiDsj3oKTFPGBvqQFWzD1LRS
	 WMVAOwNpaz+zE0peuo5xtBRf18X2s4fw/Ur7G6Szw2T9sOw8T5m8aoMIyOCxFwRvAfhrs
	 kbWhXcVVdeOMUpNKiSy1dDoJycbxnksAt2x8qTQM2ifCROUqQeY1XdPfWAoHPNrKexU+r
	 yPmkWwlnJIqVC9UHyWr8PiRet0zrro2wS1GNG8JYrn9Lz1trVTcOVKOT2SO61gvBHVit7
	 pocN/geK6i+djG5qpFUGB1K8nzPCYd0vhzhuv+19F1mn1qCx9sFi6TsNTqq8a77Z+ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795406946;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BtiPrcBfsD5mFuSC2CFNcDeCfcErC12Atx3v0TnNNw8=;
	b=VWELh4bDMjEsONjXNhUMufrw8jyn2jwGJMM6mKNjX3qe7lUbFLKlDdn8By/dsn0aZV3/
	 EUgAAxMqrXZk0h+7tZPSFCwWAW/OshtEsG8IRvDxVVOHMLVnbmODEgBKPO6d1bMXKplmW
	 5fTSAfiRPrITuo4m66oW+zWFhXnVG6De4WO/Wv7XNCkkQzoSLXOKOM+UKfOV+0Gomb0LA
	 Gyg4PyRMhmBrhSun+VY2PeEHUR5niLLwRpI2aNch3NZU8jpfTsNXA2zFs3mDeeu9MILW5
	 ipQ59ZhnXNFBqlo9Kt9CWBK5VRCt5vqxVWXuGyEeZah/dH31Dpll7wQM1hnzD1rM86w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uFI6fXON;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96340606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 04:09:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96340606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uFI6fXON
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3863db981d4so3729481eec.0
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 20:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795406946; x=1796011746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BtiPrcBfsD5mFuSC2CFNcDeCfcErC12Atx3v0TnNNw8=;
        b=uFI6fXON+Sl/Kx9AN7hdZ7oul1UiRTqjvT0Ci+D3lQhJ5VzJs2Hhn9Q+FnlfFPLY4S
         CFBTocoquxvAyN3Nih8zMGcj4WAFVv3Q47IwKlCvt9if4pys2+Ds2xZ6mecan6K+7jVP
         rrd4Np4H2y7d1P9o39XgdzJIga2H7zM5EZAQs6GablqppJdwYejshIndj9uTi7ig70la
         D5uxbjvjkzDI3c7LvBc6cTukEwsv9AGJAtfuUldP2t5pEuLqWHGlJK8aJ1Z3Y33yvAbS
         5UgAbbT5JZuSfKIdm8+5l3fhQf0d1RhTSI4k1MyUxeXVhaQWDebU2DGQdiwByjemnETw
         FAow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795406946; x=1796011746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BtiPrcBfsD5mFuSC2CFNcDeCfcErC12Atx3v0TnNNw8=;
        b=WW5AUAwCRDomPymZ0Yqqe81xGQd+sghMAdCeXFIc1syCXzzNmwjaEz5pQq26fi/hm7
         BlhFhoBzLdUix/NNEea8fZkexYwOJanNxg6x3+NkemhDb+3QdSPcfhXEBczNhO3bhSWi
         WIQ7mxMdtKwn9WDMkl3ae9YYRoIL2cvWZXniTQ9C3INrHnbX78c609Nh8IU1ggmJE/xr
         TFk+NextJ+WjpoTICAMhUaNF7tCrC2YW5ZgyoA0u4mOclCgjSkStISQSEZl7h7jrKEkt
         thJ+u6+gbaz5Y6piDicn5Jd2saM5kBy4dLYpkwvtngkGNV77oFrufLZYa1+jpOW6u+23
         K0Mw==
X-Forwarded-Encrypted: i=1; AL+hErHJNJwqt8mRWi4HupgncpN4uIMHbQ1wTBTVd0HrvgGdbI2h7D2iKRVA9vVDxYFq+dhIE+FrNJc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WxszdsK0gzaoeNG9hSs3hkGNdod5V05Y6ell4Qo6vvHggdhUI
	Uqfy4gXVKBM37Te/QbJ9x4ZTW0p1CdaXBNh40lL+vaB8UgmU2AFJM6g7
X-Gm-Gg: AZFdTZeWplj9kPUlN/SNWxdLgCrVO5P238SDOVrI87RU9eFLa6qoCLhWHVzbAbt9Cg4
	XdS33L2GJy2cd0EnQDVrXb4QzMjqB3fSvWGhPmztlxBKTr4hf9vOrQaSUV+G3q9O3uMj5sWgnAB
	5O83bIglGluboh/2L3t5bCCYbMIlYj6hbj4NO7No8BEDLwuXW8Ugv1UsjVeRUF7Z+px/hVhlAIJ
	qPQIvmYvCeijyNJd3A2UG9SUXFvFU+f6gG4X5zkeZCAHKz9qOzDaoOWolIp+VP5Q6eRdif4/mgV
	kY/z5yA+Ij5kwP0nnPe7QnMJEv08Pp8FPJoOKrXY6edSKxS1HzG7UJnN1t9plZZnKSeGpkLRxlv
	8666IC1ry6cBHe+iP+pPwRV2tTSswkOBsfDj1qn/XWftNKXPzh6HrgFUgnHm5KR0p9hxXf3WaCB
	PmZdJtweOY2eSX+qvXNRroHaqQ0yB+fuWWaQZqqzPDbyZYguGDPnvYiLejIpXt7RiYRKmKZvfqh
	hjTB0o+5OJBst9iRFWy3fm0r+ADkEuFraiwJEPU0yWQcnLm8A1NFkYx21YPz6gBNCsCnbA7YYBB
	x8AmHnIh6il6ww06AxBpn1zKry6lTymVJ7KkMONZYBnk9+7tD5e+gbLM1rnEGc+k2qc=
X-Received: by 2002:a05:7301:6486:b0:378:1191:43ca with SMTP id 5a478bee46e88-3863f1355b2mr7829460eec.18.1795406945611;
        Sun, 22 Nov 2026 20:09:05 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c0c1dsm33451547eec.21.2026.11.22.20.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 20:09:05 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: Xin Long <lucien.xin@gmail.com>
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Jun Yang <junvyyang@tencent.com>,
	linux-sctp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3 0/1] sctp: fail the association when the INIT-ACK cannot be processed
Date: Mon, 23 Nov 2026 13:08:59 +0900
Message-ID: <179539544818.3016044.13738712075053349592@gmail.com>
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

When processing an INIT-ACK fails to allocate memory, the association
stays AUTH capable with a NULL association key, and close() with
SO_LINGER {1, 0} then takes a reference on that NULL key. As Xin
suggested, the patch processes the INIT-ACK and sets up the key
directly in sctp_sf_do_5_1C_ack() and fails the association if either
step fails.

The issue was found by an LLM-guided test generator that we are
developing as a research prototype.

v3:
- Pass the error to SCTP_CMD_INIT_FAILED with SCTP_PERR(), like the
  other callers; SCTP_U16() made sparse warn about the __be16 value
  (netdev CI).
v2: https://lore.kernel.org/netdev/179514851805.604157.8527055700821138420@gmail.com/
- Process the INIT-ACK in sctp_sf_do_5_1C_ack() as Xin suggested,
  instead of skipping AUTH in sctp_auth_send_cid(), and remove
  SCTP_CMD_PEER_INIT and SCTP_CMD_ASSOC_SHKEY.
v1: https://lore.kernel.org/netdev/179505710266.3511678.14017674052424733262@gmail.com/

The patch was written with LLM assistance; we reviewed and tested it.
With it, the reproducer from v1 no longer triggers the report.

Kyuwon Cho (1):
  sctp: fail the association when the INIT-ACK cannot be processed

 include/net/sctp/command.h |  4 ----
 net/sctp/sm_sideeffect.c   | 40 --------------------------------------
 net/sctp/sm_statefuns.c    | 15 +++++++++++---
 3 files changed, 12 insertions(+), 47 deletions(-)

-- 
2.43.0

