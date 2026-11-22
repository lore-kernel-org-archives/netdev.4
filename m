Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795323666;
	b=y8wepY7XhB3QzEr/KUPXa25CUNezdQsx8X3n41k5J/VeuC1/vMoIwhi4U4knSnlU3Jql
	 ohpMnXwXmlD664q0+WXxNAtkVRM34zCStcDEJYJ56ukqbqM7/I32IQDbpW9qCeVbS5rND
	 i7s4a4xubla9K+6wJ85bwaecQJtQOQJiyOH3d5VWxtGrsiASgoULtWZa3srpxjFG+O9lw
	 dg19c6UetY8R3NWQIeFvQIBtDVCfWiOHahMObYP+BTBkScTt+U0hBc1Yd/LHBWJWI4vLB
	 SYxB3haIfpkdTsEmuNtWYZ/G5tw+uliG94sMpCH3hIhvl/ZpNxP1nqY6AHBEUiowG0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795323666;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=8sO5baWR5ydBEJ8ZbvTGeWnxXFHzKoOvclS5abJHCLc=;
	b=J8MYB0KT30f0rggHyQqkcTBrHLojzPfKeusN7sL17FcANobsSws0GNZKNf7WiRFztMFg
	 shQY1iIFiFY6yRwYkuSNeqxH90jHTUwRlFaOvujxzCYHwPrmhpPDdh+4oDei5kGCeM1iU
	 2OYY7h1AC+UEeaywFiKmlbVwTvv9qN7HrtUDaQdy4GpD/JQVsuhWr5Bu09ynQcf5SRKKw
	 CYi8jr8h/WjlWekj1gjLgNZ4eanG7yKFBeArxjmpZNbY5z7xOOCxL9nG914+8TdPgN/8X
	 VTzZ21pKWLASDlASJ0Zm+DsXJ8mjdjDletaqzvuIvKBu3Brqoipfe3sVujPsznJG2BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ICGUHgEz;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE649606A331
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 05:01:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE649606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ICGUHgEz
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cdba1b5ed8dso1116928a12.1
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 21:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795323665; x=1795928465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8sO5baWR5ydBEJ8ZbvTGeWnxXFHzKoOvclS5abJHCLc=;
        b=ICGUHgEzmNAkS+6+rKhYTvE6UimbSj2StJZBaerKMoDxcmxCubWLSfIHmmxQl1g4DO
         xxjxxGyvi4Eb87Uhm5z1rVC/3+Lu8Ug41jt/l9KYP/xhG/u5LwceuCJXjo3z5Wcb/HKO
         Wg0c2fa9Qm7MlGug/l+rjLLBmKeEHwEyiPYMdi6E6IYzPU13+4L/+iYbAxD7ZOc0o0Xm
         fCE3/fSBEPDY2zHarYLaKuJD8PKdBr/TTI7gHmoX0AzNX2Ne6jBd9lcMstA7Z+b1egmD
         Ua1DI4I2pkXHdxccbdJ74lAnTgG9nerswqE7ekxTGTgAsUgnXNjJhAbWqRuQNxNsNnlr
         TQhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795323665; x=1795928465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8sO5baWR5ydBEJ8ZbvTGeWnxXFHzKoOvclS5abJHCLc=;
        b=WItwwuAs2NKLSpOxTOMpqqpSsERaS/JLjD+EJEcXuQMAuh2c3xFBlNaU2lgTWOLmDM
         0mK21wzz1/LwB7yWPbDU8XCPy8PImYft0tQBtj44uF9HyA7jCke9w7J0nH/n4jnfUL92
         I2rqqIqXzQVDKtoqiOn7q6rsoK0Y3/BNcShRdL6D4ZWFHyNOCrTdtBbxWV27KE42EqTv
         bwLtZSk7zScagiqK0UJ2CRtwrjpEScOrzsOfsxCkAIIl4q+jhAlpHdo+baYDFYwx8AV1
         UNLkgFfo+D8VgMYatSoES+s5Lx99m6ejYrwZmYk9LtXw7geBVeaeUzzZoHWrEs38VsVC
         Q0Kg==
X-Gm-Message-State: APuU4Z94sj5FfVk43ChkiacG9J6NKQ+rrMFnSsM2SjeEPnFInSE6GKKC
	DBngrGopsk0n6ijPvgNIbiecfisM/QcqtIYYlby9CRYHE0Blwtlp8DjsF3POPgZr
X-Gm-Gg: AZFdTZcMtJcyJwnkG2ElXgZ/Zk/TIeNwPJHBv0esoTeAjzFLYxiYYgjcDQWBspafZZZ
	/9olsETTmkF7HuPa4XBbcVD82NdnmGuRJN9rBsRi42NFAr+PCa7i9JRA8TKhuR+PRMWlqpEqk/9
	RAkjGqladhRwXjgoDCHmVhQxJbX6KyqFV/lpSe3lMe34OIdyKrC6JD694G2AKTPyRpaTUFIawJu
	XEtTfdfMNsC+F1OI/8umpM1GRQaWqDkCoV4/IDByXO3xY90DpNMQxTO0d9DikEB6wT7EdQ6rv5s
	Zbk6X28yhhx4MooTMAHKcfw23mGi1TWlCozLBwU8R/a7HeWe/VrU2b9ZJcKM2iOQi8EuBanaUh/
	QzRcvTUm2WEuz2id2MBDVnATuFUsFKVJM007hOcw/3ta7pI5YL+3KnoLUQLDnR3m/AoHz8BBrF6
	W9Rx6iHsb+5PR60zcmgLfLMMRqUCyt+Pm2pnNpLlAd+B32vgzpzUdlvVRRJjLKHk97MOxC3xtZU
	L2HJ1y9d0svi+Rpqale8mY2x/+8/NNhU6on5kXU62fhuttcJ0Ac8ktHmn+Ghc52ABClpqWEl8lh
	kUeZPwWNNa5c9K3KRGUOk1TyjPtAhjz1jh1qRLk=
X-Received: by 2002:a17:90a:c10e:b0:3a7:a3c8:8f4a with SMTP id 98e67ed59e1d1-3b41c9080c5mr5222821a91.18.1795323664828;
        Sat, 21 Nov 2026 21:01:04 -0800 (PST)
Received: from x1.hs.local ([2601:600:a482:7d70::4d5e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b82e624sm3431606a91.4.2026.11.21.21.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 21:01:04 -0800 (PST)
From: David Westen <davidlwesten@gmail.com>
To: netdev@vger.kernel.org
Cc: loic.poulain@oss.qualcomm.com,
	ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	m.chetan.kumar@linux.intel.com,
	mail@maciej.szmigiero.name,
	linux-kernel@vger.kernel.org,
	David Westen <davidlwesten@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net] net: wwan: iosm: always send the host sleep message on suspend
Date: Sat, 21 Nov 2026 21:00:39 -0800
Message-ID: <20261122050039.861287-1-davidlwesten@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Unless the BIOS reports D3L2 for the WWAN slot, the suspend callback
only rings the FORCE_SLEEP doorbell, and resume the FORCE_ACTIVE one.
Neither waits for the modem. The driver doesn't keep the device in
D0, so the PCI core then puts it into D3hot anyway. An XMM7360 in a
ThinkPad X1 Carbon 6th gen doesn't survive that: after
suspend-to-idle its execution stage already reads CD_READY when the
resume callback runs, and the first port open fails:

  iosm 0000:03:00.0: PORT open refused, phase A-CD_READY

The modem then stays unusable until an ACPI reset.

Send the ENTER_SLEEP and EXIT_SLEEP host sleep messages on every
system suspend, as the D3L2 path already does, so the modem knows it
is going to D3 before it gets there.

This ignores the BIOS RTD3 setting for system suspend. The setting
only selects the sleep protocol; the PCI core chooses the power state
without it, and here chooses D3hot, which the doorbell protocol
doesn't survive. Honoring D0L12 literally would mean keeping the
device in D0, as commit f4dd5174e273 ("net: wwan: iosm: Keep device
at D0 for s2idle case") did. That was reverted, D3 being the expected
state.

With this change the modem stays in RUN through 2 and 10 minute
suspend-to-idle cycles, and its data session keeps working. Platforms
that do well with the doorbells now use the messages too.

Fixes: be8c936e540f ("net: iosm: power management")
Cc: stable@vger.kernel.org
Signed-off-by: David Westen <davidlwesten@gmail.com>
---

Notes:
    This is independent of my S3 series ("net: wwan: iosm: fix S3 resume by
    re-binding the driver around it"), which leaves suspend-to-idle to these
    callbacks; it applies with or without it.
    
    Maciej suggested forcing the D3L2 path for suspend-to-idle earlier and it
    helped another XMM7360 user with the same CD_READY symptom:
    https://gitlab.freedesktop.org/mobile-broadband/ModemManager/-/work_items/992#note_2938256
    
    Tested on an XMM7360 (ThinkPad X1 Carbon 6th gen, BIOS reports D0L12)
    with 7.2.15 and a debug build that forces the D3L2 path, which is what
    this patch does, logging the execution stage and the PCI power state.
    Starting from a fresh ACPI reset, the doorbells left the modem in
    CD_READY by the resume callback after 2 minutes of suspend-to-idle.
    With the host sleep messages it stayed in RUN through four cycles of 2
    and 10 minutes, two of them right after a fresh reset, and ping over
    wwan0 still worked afterwards. The modem and its root port went to
    D3hot in both cases. This patch itself, backported to 7.2.15 on top of
    my S3 series, then passed a 2 and a 10 minute suspend-to-idle cycle with
    ping working after each, and S3 with my series still works. Built with
    W=1 on net/main. Not tested on the XMM7560 or on a platform where the
    doorbells work.
    
    The investigation and the patch were done with an AI coding assistant
    (Claude Opus 5.5). It read the driver and the earlier discussion, and
    added temporary debug logging to record the execution stage, the PCI
    power state and the messages around suspend and resume. We wrote the
    change and the changelog together, and I ran the tests.

 drivers/net/wwan/iosm/iosm_ipc_pcie.c | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wwan/iosm/iosm_ipc_pcie.c b/drivers/net/wwan/iosm/iosm_ipc_pcie.c
index 49052eb511ba..dd7cfe3747ef 100644
--- a/drivers/net/wwan/iosm/iosm_ipc_pcie.c
+++ b/drivers/net/wwan/iosm/iosm_ipc_pcie.c
@@ -406,14 +406,10 @@ static int __maybe_unused ipc_pcie_suspend_cb(struct device *dev)
 
 	ipc_pcie = pci_get_drvdata(pdev);
 
-	switch (ipc_pcie->d3l2_support) {
-	case IPC_PCIE_D0L12:
-		ipc_pcie_suspend_s2idle(ipc_pcie);
-		break;
-	case IPC_PCIE_D3L2:
-		ipc_pcie_suspend(ipc_pcie);
-		break;
-	}
+	/* The PCI core puts the device into D3 whatever the BIOS RTD3 setting
+	 * says, so the modem has to be told with the host sleep message.
+	 */
+	ipc_pcie_suspend(ipc_pcie);
 
 	return 0;
 }
@@ -427,14 +423,7 @@ static int __maybe_unused ipc_pcie_resume_cb(struct device *dev)
 
 	ipc_pcie = pci_get_drvdata(pdev);
 
-	switch (ipc_pcie->d3l2_support) {
-	case IPC_PCIE_D0L12:
-		ipc_pcie_resume_s2idle(ipc_pcie);
-		break;
-	case IPC_PCIE_D3L2:
-		ipc_pcie_resume(ipc_pcie);
-		break;
-	}
+	ipc_pcie_resume(ipc_pcie);
 
 	return 0;
 }
-- 
2.56.0

