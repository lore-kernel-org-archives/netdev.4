Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794938137;
	b=Xn61ObbuqkqKD1Cdm+cTjpn6Mb4t0KoVNXSv3pwQtnGjKkN9cxvv4mWLJN+4gy7nnokr
	 OjgFaA9GyBsMuM9mfsQLvy66D3TNMau42E8u4y8aDU17Ae2lk0Lw1KfbTKkn/wjsFmQp4
	 7MHETC4p9gWillGQ8YUEEKD9cFQvHhg3dKk+4ss8Dts8fHw6fOpH+Bo8PgZFxziG1/4yg
	 TuZd+tzkVxYxVQw/wMti62SvK5YvL2N+tA6IuTy8DYpR46q/WXQhZbP3d6aLBLt7yGv4C
	 YwSpDbd0ZWe8/Hdv3RUz4ZikOSkH4MHBoWVLhZ88iz8VdPucqhf45Tp6T/2AESPCH9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794938137;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DiOvznsls4pfppofX09Ng5U9MzxIihkB8Z9pWKPweyY=;
	b=PZNr8XOZ1PmN/dLChBOL6sRdy8NbBAZWeoEejPMP7WdkFp4GbLw1X/DiQfegaydt94qc
	 xGRK8mBWGR9mveibqb4JCP6NmhwSF4Ul/mpAv9gf5ua5+hbbltDK56jn0/McQm9gKT7wy
	 wofwV5SN0+9aK12GWCpIbdLg8J0L4jPEieRk9Nl8FBknEuPmEKPa8/pZU9xJNAW+Sc0Wk
	 eQeFQGdOGVRzjLurWMJtUhMUB9xj+Ts6x0pefbHDvqcget+nlp6Xl+cTHVhi+Y4Bll/Bd
	 J+JLUdTzvgiX/w6SQj5NOPejIeTN1D5BYXycJZStQViMWE26MSeeCX5wFI66Xnv7ewA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uJwfk2Ib;
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DCA606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 17:55:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26DCA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uJwfk2Ib
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-38277fbed9cso30973eec.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 09:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794938136; x=1795542936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DiOvznsls4pfppofX09Ng5U9MzxIihkB8Z9pWKPweyY=;
        b=uJwfk2IbG/RK2lgLEXqp9CUn1E2hPAuaCTH7eQa4nW/mF6iepfo8hOz6Qh1ORROp5B
         41UZBJl5IaqGNww2mdXTVK/jmOH+khwbnkeYib2eqHSzj0ufaISvm7QT7DrwOTx5e37M
         L9ydJ0fL57bZCufO6qWojJX3lu6fzjp82mfZPOC2Xj6rc1elr51OgZr1fHxXetakSpAw
         N/q5lQuW00fa1Pnue9BbTndZ77X8IZguZwfo74iGHigaK6dWGSH9v/QXWTqecEze+cb4
         OAR0aWBTifhpqqCf5C6ykYLuK5Ah05a+yYyhvbNvsARwFp+MQd+LPLAjgzo0Ghk7FonR
         UEuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794938136; x=1795542936;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DiOvznsls4pfppofX09Ng5U9MzxIihkB8Z9pWKPweyY=;
        b=RJQMIGJWhXjMEs+Pja1jNMT5Eb+xHb9QBSibCAmF9Uci4b+40bKMqxw/EoYMI9IIDu
         RBqzkaUeH1ZJNYegYp8Cqo/s4aTLgFMZYJM4E4FdYGjATolI2jtb5PsLCDjN36nk+rVQ
         Mco64RBaH/WhmMJEy0lnWEGRYtrd72McwV5NZr/N0Q2YEFjumx5zwTd9JkFiEJIwhLCz
         vninEfhvth0S4DMeeBa3jQuZDwNR+0IIWp2orNxgNy1TvKcdENJcfFGwLzo577t2Ak6K
         L6LtPNUFCvT3GxmSVtQ1A8FfkVZweb5S+1Tw61ae7u4H/QHtlcKCT0s6ueoA8CwqsPqW
         jz6Q==
X-Forwarded-Encrypted: i=1; AL+hErEc6FBoNXl2IctU12yTGQoqOPAKSVn087cgEAUGkQ7Vhd5ukP8duX7LqO+qQY5X1Xaj6S7JMk0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AAVLylVzWlsgYmn6lHzFNEQ+Q4AOfn3maFAdzTT36xIWhPC4w
	KQS/xxfIz+xkDPQTegAW4WUTTcaQcbmS/LmrRISowPR55Kq5KLIWPA99
X-Gm-Gg: AZFdTZf4zvUCeykmnpB1JCXJNXmgCk/oVjUcUav6prs6YPfPHaASdFaBKq4UO3oU53M
	TQv6uuCXDXNZ3Lquias+LHijh9XD4A9l+f8R0wBRaEAZlV9wOHkVl8lKzq65KKCDmb75M2MABtx
	QWcJ69fIlwsFsnThAUTS3XchBXKzlo07mklpzYlM82BI0jCKq6PXHLx6F2aRvDxz+TU1sGvKqS2
	BO3MXdUpohIq1+5ncj767JRp/fASBTjht73B5oBqDeiI9bmcTRWDp1HZ5L2VWJnHvfmlmGiuYrG
	y32Pa2UTWj5c1V3H9bHurznYQUz4ErwkRaA/RTYqMlSFqGrkKOdu34SGmeulYYlsLdQOV1dIJVT
	XcCLbLUS7SQBUce9aotnUNqB8OTroFGKSr93EfrKr5dCdXusOHvhLrR3bO0j6mrHoElbOnuEJ0t
	f2qvPdpbyFbDOtJDl7ZvUZELaJ/wua93oSsUY6/G8PPuWN5Og8HWCHiPwCYcmFn9Lj82p00kxCA
	OGe9B4s2xL1q/7era3jj7D8Z/ASQkzlz6V+RH7iS7U64dplL4fVCZhFO1xb3kM2hCdrYizYZaeS
	C86eFT7AI/3PJl1krAoXTa2bxjcUF81D2nG7CxU9CPKrMo14ndO4FgeWqcD1
X-Received: by 2002:a05:693c:88d7:20b0:36e:aa5c:7851 with SMTP id 5a478bee46e88-3828141dd08mr152849eec.27.1794938136086;
        Tue, 17 Nov 2026 09:55:36 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38116afd7f7sm9064845eec.17.2026.11.17.09.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:55:35 -0800 (PST)
From: Coia Prant <coiaprant@gmail.com>
To: Jiawen Wu <jiawenwu@trustnetic.com>,
	netdev@vger.kernel.org
Cc: Mengyuan Lou <mengyuanlou@net-swift.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH net v5] net: txgbe: fix stack size for PHY interface mask
Date: Wed, 18 Nov 2026 01:55:28 +0800
Message-ID: <20261117175528.3018609-1-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
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

The DECLARE_PHY_INTERFACE_MASK_ZERO() macro currently defined in the
txgbe driver incorrectly uses PHY_INTERFACE_MODE_MAX as the array
length instead of BITS_TO_LONGS(). This allocates significantly more
space on the stack than necessary.

Since hiding the zero-initialization inside a macro is discouraged,
drop the local macro entirely and use the standard
DECLARE_PHY_INTERFACE_MASK() with explicit zero-initialization at the
declaration site instead.

Fixes: 47f848aac4e7 ("net: txgbe: initialize PHY interface to 0")
Signed-off-by: Coia Prant <coiaprant@gmail.com>
Cc: Jiawen Wu <jiawenwu@trustnetic.com>
---
Changes since v4:
- replace DECLARE_PHY_INTERFACE_MASK_ZERO with DECLARE_PHY_INTERFACE_MASK and initialize it to { 0, }.

Links:
- https://lore.kernel.org/all/20261102212506.3348537-1-coiaprant@gmail.com/ (v3)
- https://lore.kernel.org/all/20261110160554.918652-1-coiaprant@gmail.com/ (v4)

 drivers/net/ethernet/wangxun/txgbe/txgbe_aml.c  | 4 ++--
 drivers/net/ethernet/wangxun/txgbe/txgbe_type.h | 3 ---
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/wangxun/txgbe/txgbe_aml.c b/drivers/net/ethernet/wangxun/txgbe/txgbe_aml.c
index 26d0cfc58ee2..a21bc55c39ed 100644
--- a/drivers/net/ethernet/wangxun/txgbe/txgbe_aml.c
+++ b/drivers/net/ethernet/wangxun/txgbe/txgbe_aml.c
@@ -202,7 +202,7 @@ void txgbe_set_phy_link(struct wx *wx)
 static int txgbe_sfp_to_linkmodes(struct wx *wx, struct txgbe_sff_id *id)
 {
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(modes) = { 0, };
-	DECLARE_PHY_INTERFACE_MASK_ZERO(interfaces);
+	DECLARE_PHY_INTERFACE_MASK(interfaces) = { 0, };
 	struct txgbe *txgbe = wx->priv;
 
 	if (id->cable_tech & TXGBE_SFF_DA_PASSIVE_CABLE) {
@@ -269,7 +269,7 @@ static int txgbe_sfp_to_linkmodes(struct wx *wx, struct txgbe_sff_id *id)
 static int txgbe_qsfp_to_linkmodes(struct wx *wx, struct txgbe_sff_id *id)
 {
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(modes) = { 0, };
-	DECLARE_PHY_INTERFACE_MASK_ZERO(interfaces);
+	DECLARE_PHY_INTERFACE_MASK(interfaces) = { 0, };
 	struct txgbe *txgbe = wx->priv;
 
 	if (id->transceiver_type & TXGBE_SFF_ETHERNET_40G_CR4) {
diff --git a/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h b/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h
index 757d1ce8d3ad..8071464c7b90 100644
--- a/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h
+++ b/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h
@@ -315,9 +315,6 @@ void txgbe_up(struct wx *wx);
 int txgbe_setup_tc(struct net_device *dev, u8 tc);
 void txgbe_do_reset(struct net_device *netdev, bool reinit);
 
-#define DECLARE_PHY_INTERFACE_MASK_ZERO(name) \
-	unsigned long name[PHY_INTERFACE_MODE_MAX] = { 0, }
-
 #define TXGBE_LINK_SPEED_UNKNOWN        0
 #define TXGBE_LINK_SPEED_10GB_FULL      4
 #define TXGBE_LINK_SPEED_25GB_FULL      0x10
-- 
2.47.3

