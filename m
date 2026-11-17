Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.14.198.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794956189;
	b=CFmgeT3ohM14D6a9WUjLELt8cZCFFV2T1GKyKjK/bsasxw0+wSAHuXjUeBgIVPiUhmyv
	 QYQM99+qcrlI63fRfcIfi9DTATyA/bGqRAmrEbYaS0uMQBDBxdxV60qOFtNk8cah394kJ
	 gjAj4qUV2usbpoCj4VoFZwfSByPpmQjSsQmKWhisAJ0ttaiwrNgEkypiln3E/isH2edRQ
	 v+yVBvkp+7UqXNNwfAmCv78M0t2hTRfdHwYNjskEix+7+1dJPI8ZKCu3mOzk3lzQinPvG
	 d8u0+cS6rNBuMGgb36FuN6WA4cYB7O3lnhD9zruSx5B8eOleCWpvl6QjuXPpknxihow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794956189;
	h=DMARC-Filter:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Received:DKIM-Signature;
	bh=3a59zJmzKvAQJU3HZ2N5qSMu0nhsAvCBp0sy+NeMNG0=;
	b=e5TIp9zYOGHNG4Qmz2GbcedqZOT2UzXlph+LK5arV9W92zSrk4yVKNoOubQAF0blRMdy
	 LqkHYgY06L7Q4aHXmnbYrTfN5a1mF6+nnlwggfgJwwBGEdxvVpsrgyMIQzy0xYBlRX4IP
	 d1h49OCQAqj7arLl/GwJCFE5gqqkW64rRclyqop45A6bmzHKubspuonQWHqkRPspMBZY1
	 rdbFfw20uWuSwaLOC5ujuf7CSkFRVfFvo0L5jtbkqLB6zRo/SJP1j3lhjtP4Id9GyQp6d
	 v/SNqeKUVwtecu2eIbTKAyQe6d1s/WIPIgLyLoIAElB+6yLH+Gj+OlpLed/VhJA2zeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rimpianto.com;
	spf=pass smtp.mailfrom=rimpianto.com;
	dkim=pass header.d=rimpianto.com header.i=@rimpianto.com header.a=rsa-sha256 header.s=s20260314391 header.b=E5Emiek6;
	arc=none smtp.remote-ip=46.14.198.178
Received: from mail.rimpianto.com (mail.rimpianto.com [46.14.198.178])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2019A606A32C;
	Tue, 17 Nov 2026 22:56:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2019A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rimpianto.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rimpianto.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rimpianto.com header.i=@rimpianto.com header.a=rsa-sha256 header.s=s20260314391 header.b=E5Emiek6
Authentication-Results: mail.rimpianto.com;
	auth=pass (plain)
From: Federico Musto <federico@rimpianto.com>
To: Chris Snook <chris.snook@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Federico Musto <federico@rimpianto.com>
Subject: [PATCH net v4 0/2] net: atl1c: fix the RX buffer leak on errored frames
Date: Tue, 17 Nov 2026 23:55:19 +0100
Message-ID: <20261117225521.19689-1-federico@rimpianto.com>
X-Mailer: git-send-email 2.54.0
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
Received: from localhost (Unknown [127.0.0.1])
	by mail.rimpianto.com (Haraka) with ESMTPSA id 1A751935-FDFB-4345-9147-8CBB6C5D7B43.1
	envelope-from <federico@rimpianto.com>
	tls TLS_AES_256_GCM_SHA384 (authenticated bits=0);
	Tue, 17 Nov 2026 23:55:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rimpianto.com;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=s20260314391; t=1794956121;
 bh=3a59zJmzKvAQJU3HZ2N5qSMu0nhsAvCBp0sy+NeMNG0=;
 b=E5Emiek69o4rl1eEqvYIyAIHzAzvqt1xcqW3cHsdm6KNbZwhLGYiRRluiE8nSvm1FzYlFS+56
 Df9jb75V8InrOzbDrtBRLI1w23qGNm9iDYkp8V16M2G0TkgP8XShQvnAc1Rap+g9MGcg09ZMRj6
 3hCz/LqNz9cDVkSA+qiFX3vswTxEghMXO7C4hUoqVMuquJDcboMJEKgv7AA/Gvgr//b5d9vMBD8
 3Qvqc/zftpwoHLJT0hLzC0YrlH/Egn8FD58fLrfd31rHf4rJoFYMqTMXZpfVr3pfSqYc+g+SgxC
 yu69+wghVMCCL0XlP4ZGX8Mv8p4ZRqG6vp/ZJ30C5iFg==

Patch 2 is v4 of the fix for the skb and the DMA mapping leaked by every
RX frame whose descriptor reports an error. The Sashiko review of v3
pointed out that freeing the buffer there trusts the RFD index and count
written by the device. v4 checks them against the driver's own ring state
first and resets on a mismatch, as alx does for the same descriptor
layout.

Patch 1 is new. It closes the race between the RX poll and the ring reset
of the link-down path, which the same review flagged on v2 and on v3 as
pre-existing but made worse by a free in that window.

The per-patch changelogs are below the "---" of each patch.

Both problems were found by code inspection. Build-tested with W=1 and
sparse on netdev/net: no new warnings, three "restricted __le32" sparse
warnings fewer with patch 2.

The candidate was also runtime-tested with diagnostic instrumentation on
a MikroTik CCR2004-1G-2XS-PCIe, which exposes emulated AR8151 functions,
on a 7.0.14-29-pve kernel. More than 1.5 million RRDs passed the count and
index validation in a single traffic run, with no mismatch. The candidate
survived more than 15 MTU-change resets without an RX poll-wait timeout,
deadlock, Oops or warning. The errored-descriptor path itself was not
exercised, and this is not a test on a physical AR8151 controller.

v3: https://lore.kernel.org/netdev/20261103225218.19206-1-federico@rimpianto.com/
v2: https://lore.kernel.org/netdev/20261102215253.68185-1-federico@rimpianto.com/
v1: https://lore.kernel.org/netdev/20261027115156.17128-1-federico@rimpianto.com/

Federico Musto (2):
  net: atl1c: wait for in-flight RX polls before the link-down ring
    reset
  net: atl1c: free the RX buffer when the descriptor reports an error

 .../net/ethernet/atheros/atl1c/atl1c_main.c   | 118 +++++++++++-------
 1 file changed, 73 insertions(+), 45 deletions(-)

-- 
2.47.3

