Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795157882;
	b=wNEaCzlkDLbHdh6ktBBOZyO3MHAvZ6QlCFg9dVYh+9hpKfkM0VQZfCZYnvWD5Lyq1h0j
	 6QEG7BQ7Uy/FqoySmyV2Jz0fx4EErj0BtJd8Zye3tgvXUn9k1A/a3RcJnnYMcZNeO9k9l
	 79rFHiSC25PZzlzQK/XaxfZZZxX3Z1w9LdASUDiI2bADGabM0ZsUU7NYgLXR0GJTujER+
	 QTi8hOm9FN47FfGxM5yasBXshQs1YYPwtJArwKySm6U4fP0itmofaXDyxz1VVLZDbIsWR
	 o+HrtAKIxF0wjt0VVykDQtcVe+3Zd7DowCX7ZQBpr1mW/aqjKQggiNBjgC1zN6NnneQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795157882;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZVpa8bveNQUoF8hBZFsntHBuieSxDrBoOl7r8tSBYPM=;
	b=jVRqeGT9tqIotSEAv+AsrppkQ8MqdanVF9L0K95UK8NquL9HmzrFH4xnDWhTfhC2lyCG
	 YeH4DMnH4eXcwckV8W80H5tWPWlql/ffUiLetBE0IjpIMZwFAzJBn4EZk/BkyPRKxf2qU
	 Nb/Wrnw3jYJLt6fc/NrR3FyS6E5SlAY1tg3EmTAFxmniUuJhKSx5TYOB4B3NkYffVrSYa
	 9NvOJOzaRdXTkkxAnrhCWRL+Zvab6nvf2cbYax9zPWN9X4uhMVCF0u6YrEsBd9ro1bwOU
	 1BL3386oc7y6kUS0XYbBgedtbiQEzthP8qMB7WLP8jGC4x74vBJtRr7wYkk4mEjQbUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudlinux.com;
	spf=pass smtp.mailfrom=cloudlinux.com;
	dkim=pass header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=Fqs2Lawh;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0816D606A338
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 06:58:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0816D606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=Fqs2Lawh
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4a357b1c649so203588f8f.3
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 22:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudlinux.com; s=google; t=1795157880; x=1795762680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZVpa8bveNQUoF8hBZFsntHBuieSxDrBoOl7r8tSBYPM=;
        b=Fqs2LawhrfmjHFt0TwOTf/b3Avrczi1UW+HtHVl1gfPi8kos949p1mvwnoq9jkGCET
         Nq86gGhLMStvAAPMJJU1tp5JHbW2PbN+OqSeXSpKvSM3q9ugrK7Re2JMUG/+Q9NroZGI
         HQoayp/xpu1ibdlH1xf4HCPIfVSr+c05dsTZkYQX00OsV9/V8XULu/KTBpaT/zj32/yu
         GXKzTSpTYQHDXN/XgilgvwyEmx/iJgLTYohJvZ8Cp8jM7lV7Ixt6nsx6+eBRZiBxKhbj
         26JWqfKh2KnvalYsiggZYpsgjcL8gF2CAjBJ8jiWLGjX+5qTmy+m9iVun94S7ykqm1KT
         tOng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795157880; x=1795762680;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZVpa8bveNQUoF8hBZFsntHBuieSxDrBoOl7r8tSBYPM=;
        b=uWfaTypL6onrIxweWYd+wYJvQ4902bnWRr5IENV0voGoJj5fWkCOwnCFgYsbcu9Dt5
         hS7up9jistQ/BBBdoKqFEqNeltGycea4/HDqzfs+hffZeMgc3UEw83aBdAdZY5iF3sPc
         qmJINHAEZiHGh5KLIDUeGyC6YOd/E6RFsbzBiHo3P8JneYUGBR2PrqF5eBlslEyf3W/f
         GhfeKsSmw4laCyD6+Fv97p8Bs5eTbBwsbZo/VbZGv6e5bsThy8Lrfn/pJFSiR1+HO6Ir
         3hKP7QO/mNeq099MqHyBrz7D/REHGnvjpMxXFy/snmMHYtKvAe5Nz6E9xXM65Aft+7Wn
         gE7Q==
X-Forwarded-Encrypted: i=1; AL+hErEM7wZrBGKHtsUG1VbUFjRcHbbgDIshHX7xtKnUzy66xYITdbWB0ldVBLZA/cn9UiZSk2MAa40=@vger.kernel.org
X-Gm-Message-State: APuU4Z+oFaKm7eOsRHdiGWTsvT7rMQFZW7y1IkFXFNXMg6HLwrVO1/IV
	7zLxBe+iCu0+1xsiYVg2R4SHz504p0mNromsjvQwmgsMZtLix2peb/ew7ztsb1MiTxY=
X-Gm-Gg: AZFdTZf8UgVXT4b8DB5XpXxZM0yQ6lCyeIIX/p8vx7JRco0VQchISC1DeDokIJLglT7
	i7gaKNsTw/b9T12BY65/uP7ikw0QR5Qm0foi0+q8GVdEHbYdGNEK+ihdffhIdOloMjPsxZzdv20
	AaUSckx/8F9ki50IQWV8u7Kvlzxoj/A8ocL7Nkodj42Ur9VcoupxdWsNcBQNve8a69q8h5ZTWnR
	LCUTRwr0TWs+fODZwO0F2IFWmMQDPqswW8D4/wLDAkF07pZKc2C7Pk8Vf7yaquKtAwtEKo6axO4
	SrXVMBJJY7ZL8+60qooPF3qolgwejd43nT0TxtnJeeFz/GnQXfVQfg8p8FQUHMXdG4sDXdtEba4
	ts1GAzTV9M+GA3QAN4NW+MAkr/oZO+twHBTjx7SCkILcitVEEavlVexg4L9gp4dvuYkreQ/t1Eb
	4gRCJ5kuPyBm0mh15lew85w5IAb7sktJ61kWCdVvRftBpJ6HU5W5+ECVXnvoRjbt8X0zRbJmb7A
	3ZlqhKgV0KQHHb7VI0nrrIAhCJDZ8yvluZW3ti/Mct1WQRL59j7Izku/hO8TyeOXCcRIWf4TVD4
	Yq5WxBtprXwBKHO/vzGqIEsa0tOWYUElbkmv5wyfHVqZoQ==
X-Received: by 2002:a05:6000:2c13:b0:48d:f95e:6e8 with SMTP id ffacd0b85a97d-4abab02d26emr3388137f8f.1.1795157880406;
        Thu, 19 Nov 2026 22:58:00 -0800 (PST)
Received: from dev1.kernelcare.com ([2a01:4f8:172:1c85::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm4190080f8f.21.2026.11.19.22.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 22:57:59 -0800 (PST)
From: Andrey Misiurov <amisiurov@cloudlinux.com>
To: Alexander Aring <alex.aring@gmail.com>,
	Stefan Schmidt <stefan@datenfreihafen.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-wpan@vger.kernel.org,
	netdev@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org,
	amisiurov@cloudlinux.com
Subject: [PATCH net v2] ieee802154: keep the original error after a netns rollback
Date: Fri, 20 Nov 2026 07:57:49 +0100
Message-ID: <20261120065750.3274661-1-amisiurov@cloudlinux.com>
X-Mailer: git-send-email 2.43.7
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

cfg802154_switch_netns() moves all of a phy's netdevs into a new netns. If
one move fails, it jumps to the errout label and moves the already-moved
netdevs back to the old netns.

That rollback loop overwrites the same 'err' variable with the result of
each move-back. The move-backs succeed, so 'err' ends up 0 and the function
returns 0 -- success -- even though nothing moved and the phy stayed in the
old netns. nl802154_wpan_phy_netns() then tells userspace the move worked.

Give the rollback loop its own 'err' so the original error survives and is
returned.

Fixes: 66e5c2672cd1 ("ieee802154: add netns support")
Signed-off-by: Andrey Misiurov <amisiurov@cloudlinux.com>
---
v2: shadow 'err' inside the rollback loop instead of adding a separate
    variable next to it (Miquel Raynal).

Found during a backport review.

On debian13 6.12.88, "iwpan phy phy0 set netns name T" reported success
(returned 0) while phy0 and its wpan0 interface stayed in the original
namespace; internally the move had failed with -EEXIST, but the function
returned 0 anyway. With the fix the same command correctly fails
with "File exists".

 net/ieee802154/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/ieee802154/core.c b/net/ieee802154/core.c
--- a/net/ieee802154/core.c
+++ b/net/ieee802154/core.c
@@ -255,6 +255,8 @@ errout:
 	list_for_each_entry_continue_reverse(wpan_dev,
 					     &rdev->wpan_dev_list,
 					     list) {
+		int err;
+
 		if (!wpan_dev->netdev)
 			continue;
 		wpan_dev->netdev->netns_immutable = false;
