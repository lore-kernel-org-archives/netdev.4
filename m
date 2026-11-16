Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794863403;
	b=flltCoBhyfIyIglnPqCoF7Qh8eBEgpfnrTrEexLsmsiwd58mXcecjljmoVto6D1b1fvf
	 LixwnLwlUILqEICzm4UuHfxVxFtSsUXC6+n7n5YjpOE9J8/dtnxRqwFN/bE088MGHIoLq
	 WJcCNjlvxCL4Ne03WeIxxaQ0i3PIR4WCdCXHw9qCFJaYEq+Lusy+1L1Bjih8uI26dUHF1
	 Zu/qMBE0EOW2pydm0a5Kuk6t4vikNGkQ/U7MO6rjF+jbidqv9hd1iGNNA9+PjURhqZd4p
	 JKCYtzEr+/J70S6ih7klhVl64G4Gaz+RS2sSb0z1+NX0RiJs9lyNyrkIIG/uVmcilcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794863403;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=kJJKYqk5qfBQROpfR36DkUxtCSrRkzG2y4RMp/6I4f8=;
	b=0L+09UXBOXpFK77iVHeis8ppkj3TY6LIGkPhsDu1G04817RajOA3JMsCGBc3+V16R54K
	 1f+ZqrXjtRGi/zcRcGlVg87ATLgjNBzPZUzyZDwiMoCCVcRHvX/NboD+Ik6/EgUEPSfvL
	 DqwXbWVakxa7+8Iq4+DPk8NiW8U4HncIDKC2dUjlTCBt4I8N4Nv1du9BJMKpce3SAl+lg
	 q1U6m82eqRuwhmYjAHG7MsPXyHkq5APnPUYALzMxoR1GE9yWXkTFryXrZAymPkPlLCcNR
	 B7fNgsBZ2ZbSOjZeu+M9cfUTPt6yaUK+UkG1q/PWq/5FzMGQcrd8EcZR6n7QlPZHP3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=WWMB5Wpo;
	arc=none smtp.remote-ip=209.85.210.227
Received: from mail-pf1-f227.google.com (mail-pf1-f227.google.com [209.85.210.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4650C606A884
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 21:10:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4650C606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=WWMB5Wpo
Received: by mail-pf1-f227.google.com with SMTP id d2e1a72fcca58-8a07078200fso1785355b3a.2
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 13:10:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794863402; x=1795468202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kJJKYqk5qfBQROpfR36DkUxtCSrRkzG2y4RMp/6I4f8=;
        b=yOTPWcBez+3epxAKfrBCwL1hrZ1mXyW8SdrlyfBwGu4XG073gXAJILGCFByOApAKJg
         4xVN35i7X7oULVgduOGdBasG78bFh6veENXzrlG5fK7oLgHrBDnWjaKJZs9BbwpGpvNw
         yGrS5N4F9JdoAEQ7YJZOWIQAzTkmWGLTw79hBJPWYaqskVPBH4eVpgXDzanTFFlbExFj
         tUHZcTFDCr4AOxfRZ/fawrUL8xlTbGgWzLys+RGfv7VXsboaKb92ICDedj/wXcXk4Dsl
         brz6G1HaM+k7XolacBE3oENoyFoT+4aL4nIxkudZ0r2zIXBj9BwJq3oLQaRHBYkR5M82
         EFtw==
X-Gm-Message-State: APuU4Z9GraH/MgSOr9YX9oOdxxbLWdUFLchmQ3P2QHQvXw78bvf9+A2v
	QV1Pz8dL2zcKr61i6epNVaSftXN1P6RNrWSRav8JmPgY+gEbUd5CjB5Rtx0kd807TeLrOMWoz5J
	xOykrXH1dZkpb0rdYtTY8nMC0NhyOzoPMv4NMg4vgk4diEe0U3vWphL7odYZbyr/zpbNwpi+ro4
	fX8aXXTjqefNaW4kVkwXZNlE32Qczxv6U6p4iRH717AnQmm6pEx9JsYcKNdvohl/dlm1owa7Jc9
	Kv54i0Hdrh0zksT
X-Gm-Gg: AZFdTZeXXerJmdt/1qfXAX0Crvm4+IOakBbBF9C4H8MLHbr2z4TMVxOqpSS64MGI/yV
	CwP7TYwOkEP9vaxNd6pwj0s6r6rqIdag7xhwYHdxk7nh2g0J2YIiROpf36i05f+u6nqLvSFLxmL
	7PT8HpBWXcqYLejnxASk91aMFnIoSGqlccb5HmWr4pviLFcBg7FnH98Dw/PzHyfKuApWvH3MI8+
	l276OaLT+wyuKCdpRsR1ThZHKLlqIbkZsSjIusYGS3t/LDvweRgyg7uoAluRgtTjXeBVQdvzcO5
	fDiIPiWS4dNa2ZpPfkNjNKglGKzc9R0M2AH+ibxmg/lHqe4I/H+NFLz8G2rYBX9xyrFtAPbW33Q
	XkY2xyjrS2pjEhE4zS3VOtDOX3JVQ4DYmFWYph9iFWVCDYw5yFuP7GucUqPsyeR5aVHDCx4f6g3
	zujR+Qabl1/z9xAZiiuIdqY8Ur1qm5d6RkRXPCzCDdKX4=
X-Received: by 2002:a17:90b:4acb:b0:3ad:6090:a189 with SMTP id 98e67ed59e1d1-3b1b0b67b18mr12557310a91.45.1794863402292;
        Mon, 16 Nov 2026 13:10:02 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b24cf7ecsm6249145a91.2.2026.11.16.13.10.00
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 13:10:02 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91eb05c8241so70106016d6.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 13:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794863400; x=1795468200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kJJKYqk5qfBQROpfR36DkUxtCSrRkzG2y4RMp/6I4f8=;
        b=WWMB5WpoxsUq+MRlJX9fYxw3r88dto/Va4cx8bukP+dvfRAl2GH6aOnm8ntXFXbipi
         /DFUPXMPRVl0AlDPK5PZ6SuD/Gl37tHbJgytMOCpH5oBr75mBpcJ9lu4w0D7UyyITGcd
         jTuOypXcPuEcU6DSOpuAH/DtwpYUpoSTMRbFk=
X-Received: by 2002:ad4:5961:0:b0:91e:9074:19da with SMTP id 6a1803df08f44-91f241b8f9bmr178215006d6.22.1794863399742;
        Mon, 16 Nov 2026 13:09:59 -0800 (PST)
X-Received: by 2002:ad4:5961:0:b0:91e:9074:19da with SMTP id 6a1803df08f44-91f241b8f9bmr178214366d6.22.1794863399141;
        Mon, 16 Nov 2026 13:09:59 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-920fe17eaaesm3601396d6.33.2026.11.16.13.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:09:57 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v6 6/8] net: dsa: b53: reference count shared mirror source bits
Date: Mon, 16 Nov 2026 13:09:40 -0800
Message-ID: <20261116210943.1352656-7-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116210943.1352656-1-florian.fainelli@broadcom.com>
References: <20261116210943.1352656-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Multiple tc matchall filters can use the same source port, direction and
capture destination, but the hardware represents that source with one
mask bit. Removing any one filter currently clears the bit even when
another filter still needs it, and can also disable mirroring globally.

Track references to each port's ingress and egress source bits. Program
a bit for the first reference and retain it until the last reference is
removed. Keep the two directions independent and ignore a deletion with
no matching reference to avoid underflow. The tc callbacks serialize this
accounting under RTNL.

Fixes: ed3af5fd08eb ("net: dsa: b53: Add support for port mirroring")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/dsa/b53/b53_common.c | 61 ++++++++++++++++++++++++++++++++
 drivers/net/dsa/b53/b53_priv.h   |  4 +++
 2 files changed, 65 insertions(+)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index d8dafa9e0c44..98696bce368f 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -2604,11 +2604,56 @@ enum dsa_tag_protocol b53_get_tag_protocol(struct dsa_switch *ds, int port,
 }
 EXPORT_SYMBOL(b53_get_tag_protocol);
 
+int b53_mirror_init(struct dsa_switch *ds)
+{
+	struct b53_device *dev = ds->priv;
+	u16 ingress = 0, egress = 0, cap_ctl = 0;
+	unsigned int port;
+	int ret;
+
+	/* A switch reset may leave the previous mirror configuration intact. */
+	ret = b53_write16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, 0);
+	if (ret)
+		return ret;
+
+	ret = b53_write16(dev, B53_MGMT_PAGE, B53_IG_MIR_CTL, 0);
+	if (ret)
+		return ret;
+
+	ret = b53_write16(dev, B53_MGMT_PAGE, B53_EG_MIR_CTL, 0);
+	if (ret)
+		return ret;
+
+	/* DSA retains matchall filters across suspend and resume. */
+	for (port = 0; port < dev->num_ports; port++) {
+		if (dev->ports[port].mirror_count[true])
+			ingress |= BIT(port);
+		if (dev->ports[port].mirror_count[false])
+			egress |= BIT(port);
+	}
+
+	if (!(ingress | egress))
+		return 0;
+
+	cap_ctl = MIRROR_EN | dev->mirror_port;
+	ret = b53_write16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, cap_ctl);
+	if (ret)
+		return ret;
+
+	ret = b53_write16(dev, B53_MGMT_PAGE, B53_IG_MIR_CTL, ingress);
+	if (ret)
+		return ret;
+
+	return b53_write16(dev, B53_MGMT_PAGE, B53_EG_MIR_CTL, egress);
+}
+EXPORT_SYMBOL(b53_mirror_init);
+
 int b53_mirror_add(struct dsa_switch *ds, int port,
 		   struct dsa_mall_mirror_tc_entry *mirror, bool ingress,
 		   struct netlink_ext_ack *extack)
 {
 	struct b53_device *dev = ds->priv;
+	unsigned int *mirror_count = &dev->ports[port].mirror_count[ingress];
 	u16 reg, loc, cap_ctl;
 	int ret;
 
@@ -2623,6 +2668,11 @@ int b53_mirror_add(struct dsa_switch *ds, int port,
 		return -EOPNOTSUPP;
 	}
 
+	if (*mirror_count) {
+		(*mirror_count)++;
+		return 0;
+	}
+
 	if (ingress)
 		loc = B53_IG_MIR_CTL;
 	else
@@ -2637,6 +2687,9 @@ int b53_mirror_add(struct dsa_switch *ds, int port,
 	cap_ctl |= MIRROR_EN;
 	b53_write16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, cap_ctl);
 
+	(*mirror_count)++;
+	dev->mirror_port = mirror->to_local_port;
+
 	return 0;
 }
 EXPORT_SYMBOL(b53_mirror_add);
@@ -2645,9 +2698,17 @@ void b53_mirror_del(struct dsa_switch *ds, int port,
 		    struct dsa_mall_mirror_tc_entry *mirror)
 {
 	struct b53_device *dev = ds->priv;
+	unsigned int *mirror_count =
+		&dev->ports[port].mirror_count[mirror->ingress];
 	bool loc_disable = false, other_loc_disable = false;
 	u16 reg, loc;
 
+	if (!*mirror_count)
+		return;
+
+	if (--(*mirror_count))
+		return;
+
 	if (mirror->ingress)
 		loc = B53_IG_MIR_CTL;
 	else
diff --git a/drivers/net/dsa/b53/b53_priv.h b/drivers/net/dsa/b53/b53_priv.h
index c4d2a41c714f..df00a5ae46c9 100644
--- a/drivers/net/dsa/b53/b53_priv.h
+++ b/drivers/net/dsa/b53/b53_priv.h
@@ -119,6 +119,8 @@ struct b53_pcs {
 #define B53_N_PCS	2
 
 struct b53_port {
+	/* References to each egress/ingress mirror source mask bit. */
+	unsigned int mirror_count[2];
 	u16		vlan_ctl_mask;
 	u16		pvid;
 	struct ethtool_keee eee;
@@ -170,6 +172,7 @@ struct b53_device {
 
 	/* run time configuration */
 	bool enable_jumbo;
+	unsigned int mirror_port;
 
 	unsigned int num_vlans;
 	struct b53_vlan *vlans;
@@ -545,6 +548,7 @@ int b53_mdb_add(struct dsa_switch *ds, int port,
 int b53_mdb_del(struct dsa_switch *ds, int port,
 		const struct switchdev_obj_port_mdb *mdb,
 		struct dsa_db db);
+int b53_mirror_init(struct dsa_switch *ds);
 int b53_mirror_add(struct dsa_switch *ds, int port,
 		   struct dsa_mall_mirror_tc_entry *mirror, bool ingress,
 		   struct netlink_ext_ack *extack);
-- 
2.53.0

