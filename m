Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617171;
	b=3UpcV7vnTDyTIVcz84+08jTLS2j3NbtODI9GM/kAm2IhCMmMbyyT9roHF4MMxBfVyWg9
	 sYiBnTy/zixqwtGYbjz7oEp0KRnhcPU6OpkXRMhI/A6oud71avdgAdi8IZUBr0+QrIhS5
	 +wX2a72pkZhTE8iO1NCfTk2CsVEVNpgndgq2nMKQnrsoD916Yl2KJ2aXnLg1Dqm28Tev6
	 0F5MNjryKnHhTecovy1XequFc9+2iA+yC/HF9YDp4uA88Gepre31erhQI1BPxCZowcKaf
	 eawGsvXFJE9FqKbANLx/hBHV59Qps/TAwW/di+0SKT3XV+N0cGnK1aZ/0zLkq/DKbbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617171;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=I+G+ZDFPb4FfbpdCyFfeOwCDzp3rlKHbt4LCLi1AOSE=;
	b=zUdCPebUu7t0DvRds+65YZAf2hRM45ODNYmLBVawkIF0eh806VLeuz6vqb5pjWQREjb+
	 3UWqUhYAEJNcxmSHssyeraaq6QAaVguX/oIuSHm5GE48VH0DXphVORnSWtZT95fNZ0f7I
	 UvLHk2xKWToTfLqPoXVDmYqzPPk7TzillqvTYPil88xfi+iojweHwqTSNwIb30Z2FMtdP
	 EEvDH2QRVB8LuceuEC5dt9EKyWfaLFW2+UgZjcHyr583T4eQn0RCxbOouJgkcgFJf8V35
	 ljbQGzQ1Mo/cL2+E6Kw3kce9DosyxsJ1uIwHy7wgMz79fPZSCTv4uOnWR/lja+jJyvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b="Cm/tvgz4";
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=4xKfyIVf;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B135C606A68E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 14:32:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B135C606A68E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Cm/tvgz4;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=4xKfyIVf
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795617169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I+G+ZDFPb4FfbpdCyFfeOwCDzp3rlKHbt4LCLi1AOSE=;
	b=Cm/tvgz4eFNHpim7tA7hNMQhqPbQErJF7reQan4AZXJ83ZymBa2Rph8sSoxSZa8waIApHe
	IzqO9HrT4/lcgyEq3x1oAUFc5Wq0KX+WOlkstSblRjrtbiFLH0YG6PFwz6CvnFi1mqSyq+
	vfhOSBImBYK56lWLci0cDrNO8KhzUCnu0fVfPLjjCiIK7swsaElLRwXpiM9oguZu0qPjua
	cy4Jl0uRd591H2evTBwanEKa4E09Sz+5xdUsvw1rJfRWtWuFqbqSW/uO/FkvSySImb6m+r
	S5/hCNdSzAch1GtrVWgQpj6p/mKSq7Q5bzRmRtLZGnbCrjk7FvbuJTjnSjNI9A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795617169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I+G+ZDFPb4FfbpdCyFfeOwCDzp3rlKHbt4LCLi1AOSE=;
	b=4xKfyIVfdAsAIXRS88p6NcGqifIqM9NTd0e7kILd2SjFnH1cpZWJ59Ah93Bzg63o6RdDWy
	CK2vgL28zzs2fbDQ==
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
Subject: [PATCH net-next v12 7/8] hsr: Move struct hsr_ethhdr to a global header
Date: Wed, 25 Nov 2026 15:31:50 +0100
Message-ID: <20261125-hsr_ptp-v12-7-9ddd2a73cb90@linutronix.de>
In-Reply-To: <20261125-hsr_ptp-v12-0-9ddd2a73cb90@linutronix.de>
References: <20261125-hsr_ptp-v12-0-9ddd2a73cb90@linutronix.de>
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

