Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541194;
	b=GCg7O3jVGHGmyZ4erWt23Ms0v77toXUpkf2UbQEsIbUqEs5/letWrBhMwUc7rmmvyqey
	 2Y66g88sUE/7IPOBi/GJ6EqGLWw5FVpDiC5sWPNt2QeQbyNr8GdApLLsFXUmZos7cF96b
	 dcFZ/NRwmS88knMKh3yb25SLg2+FTjgoVp1HvAofeMeD63JEieCnbVF7H8blatkHzaje4
	 Hkyh8MMD+StxnxWr8Mq2Ly6gDsfrz76b9vLhzvVRlSaK506b30qmJOo+74ehlE90Xn5FU
	 hkWmJtnQy9buKY4PhYbbZNkG2N7bbIOA7AoEKbrOguh/UKvMBFWkwFGFNQ6qXSBbFig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541194;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xGEyac/VmmgifEdB7VcD49ttDd/WG7UFpt/kmV58smU=;
	b=aeMP7mNQJ9huRWjNEMKSdvaS9M+9xncUGup4BdQSrRwirAzMBYCVESSLIcYer4xJBWKj
	 Z/AkKQ3C4/cWKZJhlDPGUrcx9vhYa1e3b5QRtoxbPz8DQJSNS+JwScDUP9GTLmvG45SMj
	 4ag81bsNJ0c4NXdn6DNp0jHxMZhdUDqalX6B/Kl16JdlSTD8J3l5JmfEpIsdz/Sje5Afz
	 wZjFsoCPhxeR2Xj+U0/kDF7oj3/U2dG0x+e68f/7KnSa7hrFhMOvR/Dev1RkuHRM6ZAh6
	 vcnmgVe2ecuQ385iNNhJh+4+Mo2rfatV8qNIWeniHc4M0gSjrvHD6n6Hr0LllPnbMCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mwJUvCN3;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64485606A32C
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 17:26:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64485606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mwJUvCN3
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2f02ee04378so37915855ad.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 09:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795541194; x=1796145994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xGEyac/VmmgifEdB7VcD49ttDd/WG7UFpt/kmV58smU=;
        b=mwJUvCN3roLz/Kv+HcTjjpq9ERrM3DOSTv6HqPPKCahDa2JttX4VllFMAaCBusqdBD
         cAsJWF9hdwHrXrA6PXeg7QxAc4dvaMbY3vYcxbJbWsdh0tp0NhzMNHQ9o0z1V8rbo7Qi
         SsKIbVvDE5KhQIbLKE7v71UvsuF0nJimyTiOK38IOAU5dE0jwxnEDUb/6D0J6eLUYgzi
         gZTQloOj5/SMzLq7zcBGoBcSNXOYKAyYhyzCSkkI1f345UGuWkfLKwLJ3bchgcNQxemn
         riIqI8iJE/CwZ0o/9MdVJCx+UGx49ZdEZMr+eBkAA6SXzdqjL+0xwfmR3E1HULdCcNmE
         clKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541194; x=1796145994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xGEyac/VmmgifEdB7VcD49ttDd/WG7UFpt/kmV58smU=;
        b=dfaWlPjJMG9Maaf2RcZAUvA6hMkXxqURwY8+shwV2XsvXRnEd9EGFQJuhqLXPBG+x6
         7wAwjAv/1Yvv2TbBrm5GCalIrU77il08mOaHaRPYl1NOuobSd2e/yGabCU47aGZqDP/R
         ZXvq22bLyC8QPoBKlaZvakrBofdNoLjfRcs4Hua5PYFhG2a4UOd73l6Y+HEgW5eo8ns/
         2cTLwA/rtrhQFOPguWokXwjeqvqOA44XIoeMoJFiyXTNMvGWtLQaAp6HTMsw0qJ0Xxmc
         0G7UCwVomC5MkqRkHyRlH+hyJRQC8pzM5mW+Wl5023zlfMWZwkMovpM4a/WrSn/i/mPw
         7/eA==
X-Gm-Message-State: APuU4Z/F1Two60UOYLzfsT366SOTtsBAoi9Nx0HB58pyvz3ir5s19FeL
	nIbW02B1DdhPrp2voaYJoKOtW9nl7KOIClEvH1Xf2sM05gYfV1J04UWcApY6h2kDnoI=
X-Gm-Gg: AZFdTZfvmk60DQGCB5VvdZoYqgaFqzR4LBB/muUlsRW8gpbzKKlAISa01+Mhfkk5OB3
	uTipvQwzNgEEAQd0hpQYwr+hl+vzyO5kj4Nljbrr0Roq8X5BkhR4hmSsL+dzz/QhxR70c73Gk8I
	7hA7dH8z7rZn/wKlEuBw+LwwQJYz0P8C/gnupQJaVKKhFVfwQDZucC2JyXrow5rbf01HcvU+BXL
	kfnePKyN/F5R5ANhmCZ1zXEt7sV4L/qHVjB+wFQZWWND1dgPHCgUxfdIntRcBFA1df5nJotnz4U
	jfjmh9Sxn5uiSpVU0WwM7QuJEpCNt1ETHOynWAKXpfGKp6E1wGqg3+2V6RUbNXXlPT9NRR6k163
	/OJkSKuqwglJI2xk53/1+OI++8zFsgdJWfsHpUE05kRG1/532goei60MBa2YACbHtK1coeBKx36
	MlitnAj7ASMzasTaUCC2vKAG9Oly0Xo2fEuXzAnj7szyiNvadtqsd4m9PmbCnVRqnDKp6v5cHTg
	BLLHldvoZCx8cP+YbcRVNutZhPocxBzc5BFU24VGQyc+mfrb45TLG/IFPXTWeMutGxkoOhlNJAn
	g5r49nxch0NdQAAG+Sg4fx9LZDoh/fNrHYqPRWeEntLFBK/1S4iV4Q==
X-Received: by 2002:a17:903:2f87:b0:2ef:df75:337b with SMTP id d9443c01a7336-2f03f246f17mr155461965ad.48.1795541193579;
        Tue, 24 Nov 2026 09:26:33 -0800 (PST)
Received: from x1.hsd1.wa.comcast.net ([2601:600:a482:7d70::b4f9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f04f8aca00sm63052795ad.38.2026.11.24.09.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:26:33 -0800 (PST)
From: David Westen <davidlwesten@gmail.com>
To: netdev@vger.kernel.org
Cc: mail@maciej.szmigiero.name,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Abdun Nihaal <nihaal@cse.iitm.ac.in>,
	M Chetan Kumar <m.chetan.kumar@intel.com>,
	David Westen <davidlwesten@gmail.com>
Subject: [PATCH net v2 1/3] net: wwan: iosm: reset the host PM state when the sleep handshake times out
Date: Tue, 24 Nov 2026 09:26:25 -0800
Message-ID: <20261124172627.41847-2-davidlwesten@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261124172627.41847-1-davidlwesten@gmail.com>
References: <20261124172627.41847-1-davidlwesten@gmail.com>
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

ipc_protocol_suspend() moves host_pm_state from ACTIVE to SLEEP_WAIT_D3
before it wakes the modem to send the ENTER_SLEEP message. If the modem
doesn't report itself active in time, the function gives up but leaves
the state at SLEEP_WAIT_D3.

From then on the driver is stuck: resume skips EXIT_SLEEP because it
expects SLEEP, every later suspend is refused because it expects
ACTIVE, and doorbells to the modem are held back as pending, so no
data moves until the driver is bound again.

Set the state back to ACTIVE on this path, as the path where sending
ENTER_SLEEP fails already does.

Found by an AI code review agent, not triggered. Tested on an XMM7360
with suspend-to-idle.

Fixes: faed4c6f6f48 ("net: iosm: shared memory protocol")
Signed-off-by: David Westen <davidlwesten@gmail.com>
---
 drivers/net/wwan/iosm/iosm_ipc_protocol.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wwan/iosm/iosm_ipc_protocol.c b/drivers/net/wwan/iosm/iosm_ipc_protocol.c
index 527355a671b6..e120e1e0ba1d 100644
--- a/drivers/net/wwan/iosm/iosm_ipc_protocol.c
+++ b/drivers/net/wwan/iosm/iosm_ipc_protocol.c
@@ -185,6 +185,8 @@ bool ipc_protocol_suspend(struct iosm_protocol *ipc_protocol)
 
 	if (!ipc_pm_wait_for_device_active(&ipc_protocol->pm)) {
 		ipc_uevent_send(ipc_protocol->pcie->dev, UEVENT_MDM_TIMEOUT);
+		/* The modem wasn't told to sleep, we are still active */
+		ipc_protocol->pm.host_pm_state = IPC_MEM_HOST_PM_ACTIVE;
 		goto err;
 	}
 
-- 
2.56.0

