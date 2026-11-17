Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794938331;
	b=o0uBUU14qCC0raE1Vbcjg3NQSZiIFhEOqwMascYgO9DArM4PhaP47aV99+IXGc1Rf06z
	 d3qg0lR0Di4jOktOeXumrhrKNeSq05WOITtmrNbbhaFxe6eNoL47Qd6spy4nhmakqZ3P+
	 tB8UDJiv65T4oUhRdk1hkgpOq1iLMB4anZrkV6IixARfQufzT+j38ktKln8X4OqKSuZQX
	 LlwbqAuoeXGV/9zjPjTzoby8eGjJLcnbjD1r2sNMFRCfEVAwJJj50WPLpMgxtjTo1aNeM
	 Wkbl5FWu2nTRDOjutSzAnhwQgEBIKSsnvg+99kE1li7y8vp9mixY3s0vUnhbSfLS+BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794938331;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FGXhRut/xd1S3Ev/WWVMlwTf0b47L1BOYI/6dZtuZa8=;
	b=GhjW8w+3808XRXXp4+40EdhDzhp2Ca1x+9uCpmNA02J+fMq+R+Tv6y5LJx5krJx+q1Uk
	 23NmKybVcHPo3M0kMjduew0McUBTBmh57mLErgBMEM9fLolGrXAXts+Y1rAifxKz/Hj6L
	 X/tk/OssZmUDBjQvUyr9FwYbXfKYNp/QM0dmBH/THBd5q4HCoPUvtJ9F7lwL8hj+03m7o
	 jrHqcaCruGsqOEpGiP3P1hU0XL+lTj8Ilq/KBgReBwLpWBZmW30k077/YbTJPPfl9Q1B5
	 E8T9HhRswbOgkiy+inWpc1xYNdjsTY6TKRyWrZXAQIJp2itOkn6/dIZtZ5n8phrGP7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GdZ089KM;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDA5606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 17:58:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CDA5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GdZ089KM
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b4bd3d98bfso180598a12.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 09:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794938329; x=1795543129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FGXhRut/xd1S3Ev/WWVMlwTf0b47L1BOYI/6dZtuZa8=;
        b=GdZ089KMPSC4CV1Urj/q9YTTo5jFACSBOXXgxTurpVg37Gc+VW5GMF25CWl2KX/ifI
         YdEEAMYFQ4cC+9pD19msQIKuc8hKj9CoXdL29rSFAV59V9AlgrhXC80BXPmaurSGx9WT
         I4OdwHZlSaI7YyHkH3U014RHPj1eaicWsGIMf+iHJQ9Wl+ICCDQRY7I84xNX1Yh1h5+n
         3ZV4md47UwzHhB8WxYf5alDYmZJN1i2M6o/qB33hL0LjMgrkSAmLKy8iFXJg2WkRgsee
         ryNp/qrkHYiCj6yruSydmWvjDhkHlIdd6HitcuwgSxGJX3rAgYk5WJ+AhWQShUEmQexP
         tDwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794938329; x=1795543129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FGXhRut/xd1S3Ev/WWVMlwTf0b47L1BOYI/6dZtuZa8=;
        b=rvOc5CXFYRt/A5RaBTUxKlOkLz+iuF/1dKdNawskvTUcWHkb1zSq57shU2fS//PLZy
         0iJ+F+VyOwwtqKMna5SFmpc/HZJWM5cMOX4U6rhOu2YeR+jiyuABLFkxQV+y91clrYJX
         TY2AA+jXCgF/kX+kb0zp6IjDimfhC1/SOcfTAPc7loajluamR0mZNMPMYBBh7rpmcl8c
         3tWZTLAbG7ksCdIFnkSwwaIaYKh/VrfGxNNV0sKcNBfOEdd0ahEMGWLVCnsiXcwro2zi
         WgkJbLY3dPGceYlL9g6RyuX99lIi+hjaKcywu1pltzHLcNcLLSrxUKpTbSMODxPPVCRW
         ccow==
X-Forwarded-Encrypted: i=1; AL+hErFR3+3ZJCyx7FpLI9V6DOZU/lF1VXO0mQg7FTnPCABChxDRWMDhUlY6YYm+4KWRibEnc1zwdEU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8oQyzSS9UMvuWof2a+/xqDyd7X6i3oRlcvi8Rb3dtPekZBVaRk
	qqrxGWqgTNVSbB42u/bMFPltsTvHWAIMAMMuJ9tfQ2kehuNM0yd1f0gYSlRm6gA0HEltp2qL
X-Gm-Gg: AYBFou373FUVDo+pKYbO2QDnpYA7DaotyGLtgau7gYnmtMINhBH2BbZlU707fK42Ztm
	/LCcRB8cGhJa1cMC8L5IL73VY4ADWpEAOCaTYBPBnOuIU3TWXjCLL52+RBWibzs1LXP/VDu2siT
	5gEPxLO7JlzCnfolAxO2VIPmRkcElfaudEtLSaMkH2BmgRiPn9triKxM6HI7WmKkItFqxT9kEQR
	IlRMprjbSulLZWgtJHcGV5jt6ukM+Rkx85qrLvFcI+rQ4mLD3gF5NgqlIhbVAhjLixYa31uSNxH
	xJ3IO95IazbAHNMTcKKSn++ne82LLw3s5H4G9swLt0+2Lqmn9KFOn12nn7kzbMOYMi33nlS/X7s
	lRE/X5vZqAU4mn/laD/EgT1m4VVl56iqVpESrnvdfA8aWLSobclobugo2NPkzmKzA49Z5FjyTeJ
	Nz8nKfTjQdXTjwQFWoodiXp2P9XiKl+3O70hvtylG9qlj2DK+vqMXAQxvRHVAfhV2V2OiBhMWDk
	c0loa+bTXdhPrZJYdZXxML1zIOEWMlpW254aJBUbN3sQW2/HctiTMFd7OELUohG+f3iwSOACRlN
	toEmzlqvSQhwW2mTsUB+41cFURB5g0buj4aBDpdHGmvnyNPvig6JHrXMw0ddNQ==
X-Received: by 2002:a05:6402:3991:b0:6b5:87b1:ba05 with SMTP id 4fb4d7f45d1cf-6b887f18279mr13984a12.39.1794938328780;
        Tue, 17 Nov 2026 09:58:48 -0800 (PST)
Received: from theodors-laptop.. ([5.255.118.7])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b886a82951sm78666a12.9.2026.11.17.09.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:58:48 -0800 (PST)
From: Theodor Arsenij Larionov Trichkine <theodorlarionov@gmail.com>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	netdev@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	Theodor Arsenij Larionov Trichkine <theodorlarionov@gmail.com>
Subject: [PATCH net v2 0/2] net: do not point a pskb copy's mac header into uninitialised headroom
Date: Tue, 17 Nov 2026 20:58:33 +0300
Message-Id: <20261117175835.745796-1-theodorlarionov@gmail.com>
X-Mailer: git-send-email 2.34.1
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

A pskb copy keeps the mac_header offset but not the headroom, so a copy
of a received packet has its mac header in uninitialised bytes, which
nft dup can return to userspace. Patch 2 unsets the mac header of such a
copy, as Florian suggested on v1. Patch 1 makes the nfnetlink_queue
bridge adjustment check the mac header first; without it, patch 2 turns
a queued GSO copy of a bridged packet into an out-of-bounds push.

v2: fix in __pskb_copy_fclone() instead of nf_dup; add patch 1.
v1: https://lore.kernel.org/netfilter-devel/20261116105113.128791-1-theodorlarionov@gmail.com/

Theodor Arsenij Larionov Trichkine (2):
  netfilter: nfnetlink_queue: only adjust bridged skbs that have a mac
    header
  net: unset the mac header of a pskb copy that points into headroom

 net/core/skbuff.c               | 2 ++
 net/netfilter/nfnetlink_queue.c | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

-- 
2.34.1

