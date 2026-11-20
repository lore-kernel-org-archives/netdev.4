Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169834;
	b=rxMGAsAmqiahcFZPbEqIFCuRzGvHjEJI1CTqS/JMZ1EGhW/GTzGT/gxeCH4c94nPRL7b
	 sSo6jslioLLFnrovD9xSNKOE/0JND6B67VyFbf8rSKn0sbxAnmEUu52Iu8nkw4tVae1LJ
	 53VOTJfyxixudAeJf9rT/WvnqYrAWz7QbdLNJ0lgje8WDTsyqfVoy1nz9v6obmfUhAFLx
	 9VkOTeSjrt1P9k5D5ALt8C+gwWzbpsbi/9S68m0BuPCxdmjB8x+iEQLDrB5F6W7xJWpou
	 kXwjwkF9xO5bmkDZ/oqRmv5hV/RPYo1HCmswXME4xGHp4XQ6e+Q2bOewnCLG25Wpzng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169834;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=I+G+ZDFPb4FfbpdCyFfeOwCDzp3rlKHbt4LCLi1AOSE=;
	b=BGb4n9PQ1ik+kR4lsDr37sq55Q4lxPRClJYJxQkTM7bQRPuVQTD/3xq1KkRcI+m1XzRW
	 b94Jn9GPnDIya9EWEgyVkYyAFVlRDe14kLYY9vqpCGDaMsDqDeXHA0SqW4jUJrZLwGk1v
	 8hwmJIZyctKfjsooDV2DLsLx2w01JmsVxiZWyk8p7az7Enmw3SGxB2cJKCUCd9aC9EVCp
	 lFErS1vTteAgqwwfxrG77dWQ1rSaU7FaDHIetKkVS08Hw+Ple61Y2zl4EuSKfBfLTmZjC
	 bdsp67tyjAxEOhrmXqABsDd0RW8l9vsDkBejLvHdCASmChru9NTq72FOqChLrs+WGMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=UQ8h+bem;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=CB6NFeCp;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA69660A261E
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 10:17:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA69660A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=UQ8h+bem;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=CB6NFeCp
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795169831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I+G+ZDFPb4FfbpdCyFfeOwCDzp3rlKHbt4LCLi1AOSE=;
	b=UQ8h+bemGtY36PCcK94KetuI0oZzgsVVYZEdbr0Cuj4ApXlywvsAIdq6+ULYAghwWMfxZ5
	nuw4uyy5v1QAT/oPOR7ehO/baq0Gz6//MsFUCL1oM8VcstcwQbvrWU6BgQKJPUDbu/Be94
	yWihB2WQXBHfmPafOhSE0jU+LtwRDpheN9GsCJKbk+gQEEOJxiEUSTwZMkynL4HuP/kOVx
	CZIdk72NaKsK0gjoSH6kYnKEpmuyv4DlN+F/Pgjklot0YbOIDzXrcapg/whgkmPFLFKnKe
	qqQvU6IIaMd5LH4xOcyv8I5HLKuJEuZM33eGBiSzv96n4NsPLpKM8qLRbgF7dw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795169831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I+G+ZDFPb4FfbpdCyFfeOwCDzp3rlKHbt4LCLi1AOSE=;
	b=CB6NFeCpP/W265hQuyVeMDuURDtXNPdKwRQGDzY9/c/SPSW9NXrhHIyCs+VVYD536M1q/p
	F/7xBPdwXruPfhDg==
To: netdev@vger.kernel.org
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	"(JC), Jayachandran" <j-rameshbabu@ti.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Danish Anwar <danishanwar@ti.com>,
	Daolin Qiu <d-qiu@ti.com>,
	"David S. Miller" <davem@davemloft.net>,
	Felix Maurer <fmaurer@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Neelima Muralidharan <neelima@ti.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Praneeth Bajjuri <praneeth@ti.com>,
	Pratheesh Gangadhar TK <pratheesh@ti.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	Eric Dumazet <edumazet@kernel.org>
Subject: [PATCH net-next v11 7/8] hsr: Move struct hsr_ethhdr to a global header
Date: Fri, 20 Nov 2026 11:17:03 +0100
Message-ID: <20261120-hsr_ptp-v11-7-264c88f4f1d0@linutronix.de>
In-Reply-To: <20261120-hsr_ptp-v11-0-264c88f4f1d0@linutronix.de>
References: <20261120-hsr_ptp-v11-0-264c88f4f1d0@linutronix.de>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

In the offloading case the network driver needs to inspect the HSR
header to find out if the encapsulated type is a PTP packet where it
needs to suppress offloading of the packet.

Move the header so it can be included by the driver.

Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 include/linux/if_hsr.h | 6 ++++++
 net/hsr/hsr_main.h     | 5 -----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/include/linux/if_hsr.h b/include/linux/if_hsr.h
index f4cf2dd36d193..d0773a60c4fd0 100644
--- a/include/linux/if_hsr.h
+++ b/include/linux/if_hsr.h
@@ -3,6 +3,7 @@
 #define _LINUX_IF_HSR_H_
=20
 #include <linux/types.h>
+#include <linux/if_ether.h>
=20
 struct net_device;
=20
@@ -38,6 +39,11 @@ struct hsr_tag {
=20
 #define HSR_HLEN	6
=20
+struct hsr_ethhdr {
+	struct ethhdr	ethhdr;
+	struct hsr_tag	hsr_tag;
+} __packed;
+
 #if IS_ENABLED(CONFIG_HSR)
 extern bool is_hsr_master(struct net_device *dev);
 extern int hsr_get_version(struct net_device *dev, enum hsr_version *ver);
diff --git a/net/hsr/hsr_main.h b/net/hsr/hsr_main.h
index 53e95bae0ee27..36eb82774000c 100644
--- a/net/hsr/hsr_main.h
+++ b/net/hsr/hsr_main.h
@@ -72,11 +72,6 @@ static inline void set_hsr_tag_LSDU_size(struct hsr_tag =
*ht, u16 LSDU_size)
 				       0xF000) | (LSDU_size & 0x0FFF));
 }
=20
-struct hsr_ethhdr {
-	struct ethhdr	ethhdr;
-	struct hsr_tag	hsr_tag;
-} __packed;
-
 struct hsr_vlan_ethhdr {
 	struct vlan_ethhdr vlanhdr;
 	struct hsr_tag	hsr_tag;

--=20
2.55.0

