Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794844923;
	b=H48+XvenOTQY01VqfvtC+xF5PrRFXtIyjJaRkaQdm3IrUN5/Ba93QMz41AcbBq9I9FN4
	 suCTruMhv0bN/gM+1XYhQtsTMJVM4EhThRT8wfvfzmW/m+vbkgZHugE7D0Lc7eE4HW4Ow
	 W4jsW6y3oKkkcykqG8uQu/uKDml1/fFX+/SnKXhIqgWsQvN7elQSBN5monWT3T/pP2YW7
	 NLz5OQ2D9dbfBN7zVVx4kCN/AozRr7uDeTt1aEkhtBvTdOHZ8gilUUDNQjNkZYBQ9rM2a
	 C9cGxdOh4SdrMYZ2eQRcF7qt8UTFy3YXoqjeNsYhdRLF87FHmgp9irT6yqEqT7KoBmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=HIdoE9s9+AzNn9chfedKhMG83r47ugKY49BUgMQi/3g=;
	b=3lymNlvsWCbqv9Clx4Vo80HlBsyf2UWVWae5E1naHlgooVrS2DScbPzfP3IWI/QPaD7A
	 Ofjs93n8GIQcIZWUgpu4F5Nd+1puMs71JIM5bJCFPltKAKR5Aghickxs38qiHkRed+rEP
	 maO/+JAoLT8GIxrEeFd1+xrU8rY747nwGMHTbSpi5yYDwHgXtOerMBFcTwS24PRZMyPAu
	 z5jS7sAWumnceldhKlv7Fbx3dCnSDBysSryT7+NBpjkos5aMmNdpOI5Q131gCvh+roNF6
	 6LHuprQhcVsrsKlYFCgpGpmuomOFZDzxwjkvcDYE8jOif01V3XoavmX5UO5/H86iORw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="m/+nOmrL";
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F1D606A31C
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 16:02:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36F1D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m/+nOmrL
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so4549981a91.3
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 08:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794844922; x=1795449722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HIdoE9s9+AzNn9chfedKhMG83r47ugKY49BUgMQi/3g=;
        b=m/+nOmrLUgsGWqB6IHwUFNbAa88hsnd+irTEqCh6P5BADHuAaA6FhZNIeKhBKGkpdZ
         sgZ9M7lEXSylEztPRzfaw4yc98lG9DkvD1Ruad6IzUnS4Snw4QnyO9FMZxw8JxhXcvt/
         h5w4UZe/k9CJTvDU5JfwboBjYPBUjZWZVWi9zVtc5YQmyi9R6VILNPZc9O+3+Wd89n/i
         wdV5Qum8NJsHjYIrUQk4UC2zSXgkYG5XYwczK2LdvbTLU6AbUVV2cHOhQt+Vfg76NMhA
         n5g9F4vw7kuC7MJBWGvVMVZeUZJouZZXc9ILAcBQhDGDp1UNE+0uLetv9pxKxD+zy+Xj
         ZV2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794844922; x=1795449722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HIdoE9s9+AzNn9chfedKhMG83r47ugKY49BUgMQi/3g=;
        b=Ni5QQ7g0AsWbghQcinehLtpsbIMAZlTTeVd69pKPgcJ+cJTFPb4mWmzjSIlyjbckSR
         Hwa/DwIDTGRPzy0mZRu9zq5+DMLLal/8bCBvYk0MVFxSsh++l7oaX1xkHyE5+aAYr8lP
         AeeUB3uEO0AeFjCSV4mOiidpJcfK+YFCNpBGQ7sNdjg/DQN1etD8KXfUfPluD1fA5SNa
         54Q+KFvr7EjIe6D5M6ie4btSbPOlIWltUof8OJwqX7iHULDY6sABKnTKWa42VhPIa46R
         1eVXXtFpGgra/XfRQLFQ86ItoeSrpnd6legWH86viwP8XVsZRHOZyNzRgorUFojk46KH
         OfWw==
X-Gm-Message-State: APuU4Z/BKSSHKanhO9qPeyyLYMNzLxD6F6xTY5m0xSoUIzCNc4d7Md7F
	JhhbKqehWe7lI8DDlMqBU+WMPQ7+y1LPilTGv04QpYlXX/7FowgnuD01gJTyMA==
X-Gm-Gg: AZFdTZdsp1bO+AKbHWn9CMxsgtl3jzZ7kZ8pKWO8N+mCQdNeld/27e5uddByPJlR9lS
	N2wYJABLp8bVPTYXQ5ttRo3ZMgSqRCT3j94BDum2hqLkmX9VRcfaMPJzqkvIAw71rSHBldQHk8N
	H/lkOp1/E2sG336rE6YHuXOwOeiJg3HlELci45tDgqvmTRGmMkm4DX8QCAGS1Zn/tej+s3q/HwI
	KFTCjnkJrVTR88mrDFbqbwhTX4DmqDcnUKzDpk6hskayIJCc6z6y3trMw4iDw6kZH9KFfSnhtGe
	EacKdymOGrNK4jmVzCGjMdEkdHqk1lxzowaFsgQbCS0ddNOZaK+0riajp5XzUWXbD0ZEvY+1d6p
	iJefqmlaJhPQgFHq8btg2H55f5IE9onjI/J6HzNu+3z+A/xPJga1vflSpvZDTN2YT/4YBQecj2M
	2AetWsTulBWIiR+C+dpU4ew1zMZ/fjMpy7zIUJntZsrgL+rjxFP/Q8fehLRfqlhxkyPgmFXaVoG
	oMd5/82tbZLyafsEqYumAXEWBSKOeLIR59s9XwFnvB66XKyMwuVxx1uJpX3KFh9eoEcfCcZ14eq
	zp8lPm4p9VAACelKFwY0D7YdjvZ6pg5d9coGgTySgJ50WAZZ71V/kw==
X-Received: by 2002:a17:90b:2247:b0:3a8:49f2:8ddb with SMTP id 98e67ed59e1d1-3b1b0d4f314mr10849802a91.60.1794844922108;
        Mon, 16 Nov 2026 08:02:02 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:28::1d2:6e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1ae98151dsm17432051a91.2.2026.11.16.08.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:02:00 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 0/4] net: dsa: motorcomm: FDB fixup
Date: Tue, 17 Nov 2026 00:01:00 +0800
Message-ID: <20261116160107.1351198-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Various FDB defects. Assisted and verified on the hardware by LLM.

There are more gotchas about multi-bridge setup, but I'd leave that for
net-next since multi-bridge has always been tricky among DSA drivers.

v2:
 - include the CPU port when rewriting FDB entry
 - read the port PVID instead of bridge's
 - fix PVID when port joining/leaving bridge
v1: https://lore.kernel.org/r/20261111234110.1449602-1-mmyangfl@gmail.com

David Yang (4):
  net: dsa: motorcomm: Do not inherit ports from dynamic FDB entries
  net: dsa: motorcomm: Rewrite FDB entry on port migration
  net: dsa: motorcomm: Read the port PVID instead of bridge's
  net: dsa: motorcomm: Use VID 0 as the unaware PVID

 drivers/net/dsa/motorcomm/chip.c | 160 +++++++++++++++++--------------
 1 file changed, 86 insertions(+), 74 deletions(-)

-- 
2.53.0

