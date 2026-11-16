Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794861003;
	b=tfxSB/UVwErujMsi3X5MroEgPC3h8Pf6GP4060WCrtIJWbWBPGQAsVo3I2qYUtYkgWz2
	 JckZqoVvZ6RW6LLAKPb5FjD638vyzJynzInwiDN9TjTXzT2gUKryTu5j3j/k2y8G89zLC
	 5ZUibgIAWE91CPTjQFDy7pCBQCZeHF+SvIArazETXdyfzl/8g200VA9PpiLpn6etwfLlR
	 stXP/Kjr1ACdRDkiLdlfulZGOiYKX4e7k9QneUrgzgHMziQdlZLt4hMV0bSCP/XrdQCEK
	 q4ZfKQ6ptucbZAe35qGEVwq8uTqtAeEkjRsHnHraRn/UJ99ZCiOcAhrfPWqXhna/onA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794861003;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DRUpC1ia/SGGyXZ7wtl3dvuAfgYqDQrahDr+fyr7qzo=;
	b=RzPA/5qfjS9Piil4zvudAslgvB+0PgtelO86LYPUAdPPJElKG+qf9OQ1LLyXEAXLRVuk
	 lbcfsz7iTwMc/TsatKFFH5ToNNYPf7NlFCT1OpoFptFuI5PitFuSoJ9/5tp+0Q4FabTI2
	 BhT9jWYA/yNZzzmhbKoPGoTpxQU6dx+JFIA83quwUQCtu+84j+JI2MjnwrIqR3g4jiOgI
	 /X+teccGXBR5Yw4crk5vEKsWqRYTpTUL1Ivxn7JNgJksMF+B07HC1LZ1EKxIas01T+4Y1
	 VLbnjq02tOzSrQBpnTXAdSBl8EgzIIhtoydJWwTIg+YYNsBxqe8v6O+t1kWGqS74/EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HgTgk6uH;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128BE606A88E
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 20:30:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 128BE606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HgTgk6uH
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so3317652a91.3
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 12:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794861002; x=1795465802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DRUpC1ia/SGGyXZ7wtl3dvuAfgYqDQrahDr+fyr7qzo=;
        b=HgTgk6uHxbRJJsg8TpTOzuMkpoReUsX4Mduaet04624F/G035nH6Xj4ZCsZEXcZNrd
         OoWej/XEU8Ps5yFtz6917jv8IKLWk22cjU4v13bL9UkwHpjZUL6SsYGI+GM0wJFmSlNA
         2kUNjEzRHAH9riqQtIO0yknyuOWxYMIWabIv9202KNGnzPd4fCKqw/UwQjgTUhTuk51g
         cxYLRBgoQmNG2EAsi/4zuIg8V9TYPM6HqN9zhJ60a7DHbOAbkmXW/ZVLd14/+FIYpyFf
         +DmvfXBO0EZeqKjj1l8rkNURzl1Q0vYvStOHcBp9WUEAPn2A1wZalKtRt7lFhPeL8mbY
         XHIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794861002; x=1795465802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DRUpC1ia/SGGyXZ7wtl3dvuAfgYqDQrahDr+fyr7qzo=;
        b=Cdx9R1I/bawqbRPdKTqvg991hiNZB8QSzaL3tiGyG5egSSxg9+77MfE7zglEpIbz9G
         ApOAGqxY8215VpnIe0euBQy+XOmsk3D1WNrb7XciM2Bdh/cwaj2NmJRZ+psAaT9RZbS0
         yblNAjJmsaCXlSH3WI4PxAth7HPfhiB0k3x21HKb/SKfeiS5IVxHhB/cDqQfxsWAx6ot
         Uo+LZUSSE2HlnHUhrCHARkXjbvhtBjia7pf4m2mU2oGvTtq3btNq9eS7dY8Hso5ZOIoU
         xzeZFGA8irq0G8fikYcQ2ocCYkgAUlZHmMFpx9lD8tnOtqUiDQdg/q8RoQCwscRFzc13
         bDfA==
X-Forwarded-Encrypted: i=1; AL+hErFrLqXVv9jWtxc8euHT4TrMJJ7QnBLE6NwrP1hz/rsTul8cxBuDW5fkf3T5d2vTRpsFHlPmat0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9C6ktejbMfK2BvdZYWwkorzf55tIpHh6wc6WDZPEyEAyPkJICb
	uU2t74d8nJtFHcfdQUvwBoqv5C5/DN1CP4K3pUKxxfo039W9f3JglWGr
X-Gm-Gg: AZFdTZeLVA7fh4nTFhVfnhnrBjKhYm3AFDAEZ7vHcIIqblkMenYE5aczjKmRpbt/BR5
	KnApIU/clulFKbn8nAFjCbvVzNrcBEUFLzOz38yt8c/iUopeCdd/+b1A1sSNWooCVkNK1/f1aJy
	j/TBcovJuJBGRg2uBMkAXMLiYS38OWMRzlcvTBMeaO5Ps4FTFPGGDOkoJ/71u2mUWZjOuB20MzA
	w1o84FfD7h5RR8bodh0ex7FRhGog7pEkua3ll21eEXC9aCIU4EAz4skoyV/Ot+bZU/cMdhf5LnW
	PBKaoxtB2uK/pZuh245PlAWLrg+VEpTN5ZUqjc6CqASkV9IY9otJW2m4VTAVgKvhYqUZtO3iGgb
	7f9of1htasrOCZgLtVar66HADnKlDXxoYs8mzedtrS7xuKJZZz4G0wVGgy/e0UKbp8kC1Becw6p
	3ivtPYafBQgL8A3AkFysgHYm8pu54AUJSk/XEgbtpRJJJEJey9xH6XXGOxiEJ9jQOG/TGu1jiJC
	UrM6h5fOhiRnF9LMEVCTS4LHFdZFrjz7k/pFhl+Rb3YH8yTK3ZFbhTfcTdCiH1a+z63+6lO0kCc
	/JXpbfYedn+H/9w37Pn1LVo+ffjc6EI=
X-Received: by 2002:a17:90b:b8a:b0:3b3:a9a4:8c9a with SMTP id 98e67ed59e1d1-3b3a9a48e5dmr588517a91.1.1794861002134;
        Mon, 16 Nov 2026 12:30:02 -0800 (PST)
Received: from localhost ([2a03:2880:7ff::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abebf1aesm687710a91.16.2026.11.16.12.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:30:01 -0800 (PST)
From: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Cc: Alexander Duyck <alexanderduyck@fb.com>,
	Jakub Kicinski <kuba@kernel.org>,
	kernel-team@meta.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Mohsin Bashir <hmohsin@meta.com>,
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Simon Horman <horms@kernel.org>,
	Mina Almasry <almasrymina@google.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Dimitri Daskalakis <daskald@meta.com>,
	netdev@vger.kernel.org,
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
Subject: [PATCH net 3/4] eth: fbnic: skip freed Tx rings in fbnic_get_ts_stats()
Date: Mon, 16 Nov 2026 12:29:56 -0800
Message-ID: <20261116202957.3601684-4-dimitri.daskalakis1@gmail.com>
X-Mailer: git-send-email 2.52.1
In-Reply-To: <20261116202957.3601684-1-dimitri.daskalakis1@gmail.com>
References: <20261116202957.3601684-1-dimitri.daskalakis1@gmail.com>
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

From: Dimitri Daskalakis <daskald@meta.com>

fbnic_stop() frees the NAPI vectors, which clears fbn->tx[] while
num_tx_queues is left unchanged. fbnic_get_ts_stats() walks fbn->tx[]
without checking for NULL, so asking for timestamping statistics while
the interface is down dereferences a NULL ring.

This was found by AI and reproduced on HW.

  # ip link set dev eth0 down; ethtool -I -T eth0
  BUG: kernel NULL pointer dereference, address: 0000000000000050
  RIP: 0010:fbnic_get_ts_stats+0x38/0x60
  Call Trace:
   tsinfo_prepare_data+0x82/0xb0
   ethnl_default_doit+0x213/0x470
   genl_family_rcv_msg_doit+0xdd/0x110
   ...

Fixes: 96f358f75d1a ("eth: fbnic: add ethtool timestamping statistics")
Signed-off-by: Dimitri Daskalakis <daskald@meta.com>
---
 drivers/net/ethernet/meta/fbnic/fbnic_ethtool.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_ethtool.c b/drivers/net/ethernet/meta/fbnic/fbnic_ethtool.c
index e774740fcb5d..0cd03cbf2713 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_ethtool.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_ethtool.c
@@ -1740,6 +1740,9 @@ static void fbnic_get_ts_stats(struct net_device *netdev,
 	ts_stats->lost = fbn->tx_stats.twq.ts_lost;
 	for (i = 0; i < fbn->num_tx_queues; i++) {
 		ring = fbn->tx[i];
+		if (!ring)
+			continue;
+
 		do {
 			start = u64_stats_fetch_begin(&ring->stats.syncp);
 			ts_packets = ring->stats.twq.ts_packets;
-- 
2.52.1

