Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795792120;
	b=LxOkr9j8yiPSEtoA4wh+bMWTwoq340V3jV9IRB/HX4GgHUFkFYkwsfOYAcOh1X7X37Iy
	 AZieT2EMENha6Z4lShzuRgaW7mI4wmiqL1HcaSsl9GMzHoHssGDijDIU7TGlGapacqO5Q
	 4M+v44jGJ2600DGYReUgW6YwUVHM5qvj+IZvykYLZjVia6K1i+OUFM3Gj8uyLFpIr/OoD
	 /RcfT2MZHr9i4akhkLXMji3tTL1Q7LS3EjidIflMiy8gLtANUw4aCsTFyvq9SiGDcjmJA
	 yljJYCcfgoqP9uv0fMspW7g2tPgQ+xtz87zWHRF0D3vk8oR7AghXwwtCCfYtF75rPCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795792120;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Rspamd-Queue-Id;
	bh=GZLrIn9sZabYo8hRDanMZ9EDn1MPCyQLniDtUHdYziw=;
	b=GNJnpMKcryuNCKOSyoTmELl51klQ94luwL+aLbG8uLPBqAfxA0c7ZIxGcuo4ktVj+Jrq
	 l1dChPGTS4m4QBVYCbNG4jkiXxkmzRp9ORZq5Lfzq0FUYva25PZJEsifeO0jobsQ/F5HI
	 5RGx7OJJqhmHPS0JDyzQoMPZ5YfEY18J4Y7qEAzkQt9CxjF1As7ytnRRAO+t/SU105IbX
	 89hPGxZo0yEZLxY6rZlBr/dpzjxjTieGnT3EHJB4QqxEiWbV05Q1JEJngLKq8NcNy4YzT
	 zxYt63gprVRhmUPvAuKc5H961VSosBHKQt+BRP1KjCB0l4MTZlE1RaR0332cfg1CqLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b="DugtZN/X";
	arc=none smtp.remote-ip=195.10.208.51
Received: from mout-b-206.mailbox.org (mout-b-206.mailbox.org [195.10.208.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A2E606A31E
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 15:08:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39A2E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=DugtZN/X
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-206.mailbox.org (Postfix) with ESMTPS id 4jbcHk0dPqzby;
	Fri, 27 Nov 2026 16:08:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1795792114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GZLrIn9sZabYo8hRDanMZ9EDn1MPCyQLniDtUHdYziw=;
	b=DugtZN/Xn1D3GPE3onolLMdv8QCHeLMPTWigMDx3EsiI8Xv0XKHMrkOSQGSjyx5vgAuLKO
	HJA2oIeCo7SBu1ggauosUeTDpuaSZbA0UsI3/RX3QDMSteKpRPw2i8ExdGN8Rrpz2U6bVv
	xrb+HfdyK0dOnr3bsi6xSr+1STymnJ+mapVg2/GQ6RJSqOk7onY7PMUBn+WG3ta76jMIwU
	PrVN4UPzd1w65VdCLPNqxNE6QWCJgxc7y2JSWS+p9fLhulsdhQ4zVBC6REnT5sibq6OOT3
	oIWLSCeP0Yw+KeT4jNkEL7bFS1i9ujdpt8EEK40+7KrjShnWJl/P+9BTSUE3XA==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of antonio@mandelbit.com designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=antonio@mandelbit.com
From: Antonio Quartulli <antonio@mandelbit.com>
To: netdev@vger.kernel.org
Cc: Subash Abhinov Kasiviswanathan <subash.a.kasiviswanathan@oss.qualcomm.com>,
	Sean Tranchetti <sean.tranchetti@oss.qualcomm.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Daniele Palmas <dnlplm@gmail.com>,
	Koen Vandeputte <koen.vandeputte@citymesh.com>,
	=?UTF-8?q?J=C3=A9r=C3=A9my=20Jean?= <Jeremy.Jean@oss.cyber.gouv.fr>,
	Antonio Quartulli <antonio@mandelbit.com>
Subject: [PATCH net-next v2 0/3] net: qualcomm: rmnet: fix TX aggregation bugs
Date: Fri, 27 Nov 2026 16:08:24 +0100
Message-ID: <20261127150827.785753-1-antonio@mandelbit.com>
X-Mailer: git-send-email 2.56.1
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
X-Rspamd-Queue-Id: 4jbcHk0dPqzby

Fixes for rmnet TX aggregation bugs still present in net-next. Each
commit message includes a reproducer; all three were reproduced in a VM
(KASAN, kmemleak, DEBUG_OBJECTS) before the fix and are gone after it.
Patch 2 needs a debug udelay() to widen the race window, patch 3 a
32-bit kernel.

Patches 1 and 2 build on 7bcccc40cdb5 ("net: qualcomm: rmnet: bound TX
aggregates on byte-limit update"), which touches the same lines.

Changes in v2:
- drop patches 4-6, already fixed in net-next by 0af0e210b5bd and
  4f89bcfa1e16
- rebase on and retarget to net-next like the related fixes

v1: https://lore.kernel.org/netdev/20261126163219.1744750-1-antonio@mandelbit.com/

Antonio Quartulli (3):
  net: qualcomm: rmnet: recheck the aggregate after flushing it
  net: qualcomm: rmnet: always arm the flush timer for a new aggregate
  net: qualcomm: rmnet: fix TX aggregation timeout overflow on 32-bit

 drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)


base-commit: ccb81d5e317b0ae2cc66ca1c628c0ca907928f94
-- 
2.56.1

