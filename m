Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794728761;
	b=neG1MASwXoaxWfLGyU3otvWGN4C1/1qWuGU06BTRPnjts7aoK4EzioAI5b3gSIiB3m77
	 8EwMpLax1qPMPB3TWqypUVej+JOxE5zQh996LFK/WUMcv5BML+1kp0MB7S4j8STX1PeFQ
	 3SO7r3X5RAZzWym/00915dgNTT8IpMHm25HarGFTUfiyGu9jB8Oavy2rTzcyvEtONaF43
	 56cwGq7lWj2GHviqzYlDPbRjB9C0yxmYRRv/x0OHPbaPkVVZKw6+f06z58+fTPxKTj4Cj
	 FTapj2FMeMvdWQw/s6uNc/Q1h96K9WH1wmDlNkHC/A8JX0rQjTegoWxqaCyHC0BxnXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794728761;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=bXCmFppnlOHgAEmurgNladif/HYZYEFCrgJ8BcZWPv4=;
	b=x4u5o7yuutJMG3bHKbHg8xvaNyx0HQdOioPF7Q1wa7bwIEwEUgakR0z8BrWLc2HCyuGA
	 5ORYymb7KwmmPbN89uiMBVjFjlkytJs8BezG7Sr7mXtZw1j4M3lExFNDx27AKHNFL/B6y
	 j20Wpgq6RK8S1AG6BeRM8tdWfw7udq5olWF1lSdIYHgns+RB3l5Blpq8n7IgeqJwLnm/D
	 z8mFM7D/SWhM1DZ2bQgXo7nTWDGFINXsdODlkT2pDAGcHEa6I0AlJIWXh/3JJLVWLU7K8
	 7ET8O/EdosgX4rsVJ6JV9ESNj3GhQDmDGU0hP1yCR03ZGQu3iCpSSwxLhQIQfgPIY+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CrbACdJm;
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B695B606A899
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 07:46:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B695B606A899
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CrbACdJm
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-702fd86d674so2345892eaf.2
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 23:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794728760; x=1795333560; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bXCmFppnlOHgAEmurgNladif/HYZYEFCrgJ8BcZWPv4=;
        b=CrbACdJmIISrCeuPJihcOxY+P7oEzmYBO/8U4A7vqDSB4myAAzYVUCqgXtJWZeOm95
         76FysGZ9fNXGfIgHrVt807DwQRefZwLSTz7LlDfHEelYnq7czbaKcluZdap7w8xV+n6h
         6hwXMbdHIUrdBfLHsLmXMM6l0gx+1N/Wjf46LmJLqwewst7JR7FeM/3RY5esQJG2WyBP
         7icIMhrnLT+2/145sOy7Tes9R4PTlcBzrWknzwsmSZx7RqhljOGKuOsKf2hlmFDEkjyY
         VuppOABeog5pSUvbfdPdA9j4dTelNTqvJtStr3h/SaYkGsUYcb1+tN1mjmJtuff2gZR+
         mBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794728760; x=1795333560;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bXCmFppnlOHgAEmurgNladif/HYZYEFCrgJ8BcZWPv4=;
        b=W0qMpWScFRwr02ODxZ97wBKnoy37CbAabhJijbfEh07rqp+LpTghgJICJ3TyT39T+g
         ANay0g58uXiq/eWRp8bA+wAZUgBSSU3GLoRJxxfCvxRCdfKF/AqH9ThiihW0JlxkFqEz
         MFwLAqqQCqkk2OUJC7Ytkwywk2yYJZ6YrZadfukVZgoUzvwRh44NI9BZfz3kjwmQXP7K
         aD9i/1Y/soyHzdlqlgBK76Qa4wXz9608H8Elxsrt7whRlKtHJLZ2u6gxonyvvuZmHBAQ
         LxKTFALJTtDelBnhWmgIcvq5iIZ50yWCuoIw11vJF/YiRkXqbGSK+kdifmHoOiXvLYhS
         S6zA==
X-Forwarded-Encrypted: i=1; AL+hErF84LpLhmGy63R7R7amOYxLGC2qoQvZ3PsKk6cZ9qs1+3H+WYzXiEMhh/W86PbjXcBEGBqkYzk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9matzwoIzr3Oi/+3WGoyqwd8FM5Vw+jzv0+H2QXAv7CipJ5YFy
	5cFTvIQWRI2vUxjn8TxQiRFg5mE2Hudsy6ZsvlvcFpU/viHpVydHClkc
X-Gm-Gg: AYBFou0tT8hfNX1UHHc5Fl67po0HoLQl+KN7b8Oma5/oceRrB5X+hhkpcduIHUrt3FG
	WJ3sv74f++LdSEUMBibr/fIodmWqwXwRgYfG/qq8dBt0XDodZdsqQCG9rGp++juRkQhun7Gx2Cw
	unV56TNO9hadT2nM8dVZSLE2/UrAbGsHp2LsrLhqDH3pZe7mwuscd43qfMfcRfrFcTqrOXMvqhA
	2RrdiKtZoU1LpMi3gD2DHvOXY1uaTFBQp9kP4UiyBcjx3aW+keOu/18AOwVJozkTj8j4B1R1gPu
	gMTrSgvqCAMnuTaEst/4oyK+5cBU/MGzCthmMe8udaidbrsSF5wOQ80PwZfevjcmiaYXqA0A9eY
	9WWl7x5P1E98XIYSvLnSltm/d83/3pwFvJLDCCxjxxL+x9lCKpxlFlMHfJE6dA4y+rSlp2WyWVZ
	+jLNr2oggrx0+Tbv0XBJnNxZk4WBuNkfTCZiLtdjB6CXwTkbJ3EsV5pmhFrGpmTYFHALQoaswnj
	WtgPkNaiDEpNcAIUOAiUzSu1mijLK0uHrgoluiVjT/KbNHntCUJd/vAVtTDvD4XsltjQacLH/8K
	tty2U7rVbuYrFhU8M3Kiz/2+GifwQZUM4x4IINgNxadwQtbRqjVbQ2AKbsbbAl22+ncFZOoip37
	JU91vLT8NCmFc6hUQpqLeqaKjHv1GlArDyPyBYxKgadA8tHkbywd2CMWM8jJCM9M3DFnDwYPcsd
	INxWtlrOjIe81o+CeNIxWs9nsAmCaW7KS4t2Jx2+YtOaY19xMhn0dNqqJ06hwr6aQzBiDI4cf0
X-Received: by 2002:a05:6820:162c:b0:71a:dd93:2974 with SMTP id 006d021491bc7-71add932e3cmr1368333eaf.0.1794728759631;
        Sat, 14 Nov 2026 23:45:59 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe233371fsm4831390fac.16.2026.11.14.23.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:45:59 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 00:45:46 -0700
Subject: [PATCH net-next v5 2/3] ethtool: add a PHY receive byte total
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261115-submit-acx00-phy-stats-v1-v5-2-ed81a7f54373@gmail.com>
References: <20261115-submit-acx00-phy-stats-v1-v5-0-ed81a7f54373@gmail.com>
In-Reply-To: <20261115-submit-acx00-phy-stats-v1-v5-0-ed81a7f54373@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2

The generic PHY receive-byte counter describes successfully received
traffic. Some PHYs instead count bytes in all received frames, including
frames with errors. Unlike frame counts, the successful-byte count cannot
be derived by subtracting a frame error count because damaged frames have
different lengths.

Add an optional rx_bytes_total counter to ethtool_phy_stats and the phydev
statistics group. Count frame bytes including the Ethernet header, padding
and FCS, and excluding the preamble and start frame delimiter. The counter
describes reception at the PHY, before MAC or host filtering. Clarify the
same byte boundaries for the successful-only receive counter.

Append the new attribute so existing statistic IDs and their meanings
remain unchanged. Publish its name through the existing statistics string
set and retain the unset-counter convention.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 Documentation/networking/ethtool-netlink.rst | 13 +++++++++++++
 include/linux/ethtool.h                      |  8 +++++++-
 include/uapi/linux/ethtool_netlink.h         |  1 +
 net/ethtool/stats.c                          |  5 ++++-
 4 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/Documentation/networking/ethtool-netlink.rst b/Documentation/networking/ethtool-netlink.rst
index 8659761ebc69..1dad86561823 100644
--- a/Documentation/networking/ethtool-netlink.rst
+++ b/Documentation/networking/ethtool-netlink.rst
@@ -1683,6 +1683,19 @@ by ``ETHTOOL_A_STATS_GRP_SS_ID``. Complex statistics (such as RMON histogram
 entries) are also listed inside ``ETHTOOL_A_STATS_GRP`` and do not have
 a string defined in the string set.
 
+The ``phydev`` group provides separate counters for successfully received
+bytes and total received bytes. ``ETHTOOL_A_STATS_PHY_RX_BYTES`` (``RxOctets``)
+counts bytes in successfully received frames, while
+``ETHTOOL_A_STATS_PHY_RX_BYTES_TOTAL`` (``RxOctetsTotal``) also includes bytes
+in frames with errors. Both include the Ethernet header, padding and FCS,
+but exclude the preamble and start frame delimiter. These counters describe
+reception at the PHY, independently of subsequent filtering or drops at
+the MAC or host.
+
+Each counter is optional. Drivers leave unsupported counters at
+``ETHTOOL_STAT_NOT_SET``, and the kernel omits them from the reply. A PHY can
+report total received bytes even when it cannot separate successful bytes.
+
 RMON "histogram" counters count number of packets within given size range.
 Because RFC does not specify the ranges beyond the standard 1518 MTU devices
 differ in definition of buckets. For this reason the definition of packet ranges
diff --git a/include/linux/ethtool.h b/include/linux/ethtool.h
index c3a41fbd5426..fedc127d9a8a 100644
--- a/include/linux/ethtool.h
+++ b/include/linux/ethtool.h
@@ -481,11 +481,16 @@ struct ethtool_eth_phy_stats {
 /**
  * struct ethtool_phy_stats - PHY-level statistics counters
  * @rx_packets: Total successfully received frames
- * @rx_bytes: Total successfully received bytes
+ * @rx_bytes: Total successfully received frame bytes. Includes the Ethernet
+ *	header, padding and FCS, but excludes the preamble and start frame
+ *	delimiter.
  * @rx_errors: Total received frames with errors (e.g., CRC errors)
  * @tx_packets: Total successfully transmitted frames
  * @tx_bytes: Total successfully transmitted bytes
  * @tx_errors: Total transmitted frames with errors
+ * @rx_bytes_total: Total received frame bytes, including frames with errors.
+ *	Includes the Ethernet header, padding and FCS, but excludes the preamble
+ *	and start frame delimiter.
  *
  * This structure provides a standardized interface for reporting
  * PHY-level statistics counters. It is designed to expose statistics
@@ -499,6 +504,7 @@ struct ethtool_phy_stats {
 	u64 tx_packets;
 	u64 tx_bytes;
 	u64 tx_errors;
+	u64 rx_bytes_total;
 };
 
 /* Basic IEEE 802.3 MAC Ctrl statistics (30.3.3.*), not otherwise exposed
diff --git a/include/uapi/linux/ethtool_netlink.h b/include/uapi/linux/ethtool_netlink.h
index fa5d645140a4..2e81f7345f72 100644
--- a/include/uapi/linux/ethtool_netlink.h
+++ b/include/uapi/linux/ethtool_netlink.h
@@ -202,6 +202,7 @@ enum {
 	ETHTOOL_A_STATS_PHY_TX_PKTS,
 	ETHTOOL_A_STATS_PHY_TX_BYTES,
 	ETHTOOL_A_STATS_PHY_TX_ERRORS,
+	ETHTOOL_A_STATS_PHY_RX_BYTES_TOTAL,
 
 	/* add new constants above here */
 	__ETHTOOL_A_STATS_PHY_CNT,
diff --git a/net/ethtool/stats.c b/net/ethtool/stats.c
index 9b0d8cb07675..9b9ada615ac2 100644
--- a/net/ethtool/stats.c
+++ b/net/ethtool/stats.c
@@ -88,6 +88,7 @@ const char stats_phy_names[__ETHTOOL_A_STATS_PHY_CNT][ETH_GSTRING_LEN] = {
 	[ETHTOOL_A_STATS_PHY_TX_PKTS]		= "TxFrames",
 	[ETHTOOL_A_STATS_PHY_TX_BYTES]		= "TxOctets",
 	[ETHTOOL_A_STATS_PHY_TX_ERRORS]		= "TxErrors",
+	[ETHTOOL_A_STATS_PHY_RX_BYTES_TOTAL]	= "RxOctetsTotal",
 };
 
 const struct nla_policy ethnl_stats_get_policy[ETHTOOL_A_STATS_SRC + 1] = {
@@ -295,7 +296,9 @@ static int stats_put_phydev_stats(struct sk_buff *skb,
 	    stat_put(skb, ETHTOOL_A_STATS_PHY_TX_BYTES,
 		     data->phydev_stats.tx_bytes) ||
 	    stat_put(skb, ETHTOOL_A_STATS_PHY_TX_ERRORS,
-		     data->phydev_stats.tx_errors))
+		     data->phydev_stats.tx_errors) ||
+	    stat_put(skb, ETHTOOL_A_STATS_PHY_RX_BYTES_TOTAL,
+		     data->phydev_stats.rx_bytes_total))
 		return -EMSGSIZE;
 	return 0;
 }

-- 
2.53.0

