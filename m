Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795062446;
	b=P92+y3odEa9hYuJ8ptmvUhDNY/hNknZy6vX5a0qDeq6K7ZTpK7xPQYEjvHnPQVOQAeLT
	 pTkatvop8bo6uyqAdwt9wPEdZABjrIhNwjuPvaJ6K6AApSK1S6wP9V/7QBvZIKhGAecdi
	 3BjqPEN7R0NJFWBRqbEb7CRcmFP6BFsj9rGIyPbuPTFSKzIRY/Emx3Vu3W+1AaYYOJkX6
	 vkbTXi0nu538qUgr7inWChRBcMHVB8bYryiwwkw39z1rXoA+Q/vt6nkWwS1lq0RD+O4gD
	 GkKUcNItek+PQ4B8+M2gjmh2Sjv9RrrzIifqWqu/77uqaMAJkJSZ0HiykLaMkBBtf2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795062446;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tSiAuw+fLK+lCzb9iyG0L3kqF9lC30AMcxOsyhH7NTo=;
	b=PWCJDYOohME/hYs0OsBF0NPdA/3Bb2RlZBY3x4I6JJqDdI+EZbvSGLBh6OfY/yITNPLM
	 f43uWQ/mQ+vo3iRp/NF1cWOdFrqadKCCob0wYRx+tg9Eag4ZGIwJkWuX14LQetPFeMVT1
	 E0LpTOoVz7k5igwYp8UQmTD5QbLwbFrf0a6nDq/wuGhZyW0siekh295L2LU+51b15V8b+
	 7ch+SfHADXi4DFIEjVSm0tOpp4OEkCTckO/D+crmJR79vpqFITQ/bQ9XBO+P8kKawjbET
	 MD3K2jPhqR2HlRLXm7NYFEAd1xplmfa6bIrOmw1kSZWewf3TJ4O4xTd/eBZYOcjyxJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ijSkVf8o;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F1B60A261B
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 04:27:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5F1B60A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ijSkVf8o
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8b32bc605d9so1078268b3a.2
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 20:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795062444; x=1795667244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tSiAuw+fLK+lCzb9iyG0L3kqF9lC30AMcxOsyhH7NTo=;
        b=ijSkVf8odaohJDYaOEx6cqXbQnlhIQihKGsFIcJFz61cKPYnyl/41fSLYGuGRj0yNp
         EucHis20gwjVUWkkXwIHvmFksgxpYo4UIZ1Z+HfDGicuBzd9sbnYlOiROjGOvX/r0/BR
         nWK4sGy/EebGcVfUgzS6nuq6nFM3D0/lYWGH23K4xxgh3GrDCzJOrehT1rtuLLq1jTvV
         Jfr/FKkcun3J1Adln7brtzHttpIXCrwZUC9NyUw+u8TPjAgcHFB1uqgsU7YDECUx6VHx
         1Xe3/SNeU4rpdz2PzM+EhKCL3beVemkhCSp72+lL/5/uTNW002G5H2N2aFuGyYBvtQ+l
         5vaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795062444; x=1795667244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tSiAuw+fLK+lCzb9iyG0L3kqF9lC30AMcxOsyhH7NTo=;
        b=vc2nkcwvv0Exmoo0RZan2OjptyZXjUyHTPIs4TRIWapCBha4YcKKkVuOS4+TxQqMpq
         SyJebXJXLc2ww0MyC3AQTJIxcL6LvGmOlxmM6ChtDDn8gqZuf3j6N9Ovd+I4Oh1RlieP
         MFmQVvdOCxCdcQgThUSd46FG1vB/RNENfyD5Z12RPaCPEtWGT1wsvFDThKMSg4o6J4CT
         LoPC2qNUw7H506/IHlNjeYWsHtGFsepuIQi4MP7GEkxZsaO/r7aAlhtwmzH6Vl/DB1gM
         b5k/LJ66W5Ri7iDcWYyDnRfRiL4m+EybnKBNy28YygFFnQ1xzjmr2HoaqDhG5AqCE9Rw
         NMiA==
X-Gm-Message-State: APuU4Z+A11/D9cf+UjGP+mlQh2Ue1SRXAvJoPretN4TUC5YGs9/o7+CZ
	vOEloxTtnc7RbkyksMhAia1amDGJlXi5wiCxpBlDIkR7ovxAt58qYJ++tLfBdRJ/
X-Gm-Gg: AYBFou3qndUzvNTJqTmumKazDFzKaVgZScF3ELrVaGvxp5iimoku7sbh6AEj7CoJ7MK
	K1a6vXrP3e1dVCOFMcRm7SPyTvb8uIB/Pj2dLPtG+f+3NglknQmHN9Em2B7Dn0kc2lBPE9bb8k6
	YAZmN0lK1lTO3W21YRFp6EgzyajEw+EOxGsBixnuptMIb5q0xjtnGi989ZHo9HkF2HjkITHpP5X
	sn0Map3Z9r74jP6+ZQxYmi6C+P/mfO2d/rbT0OhC7mcbAMrD/HlabJnl6clTPCHT5SFxaoFjYwb
	b11xYZ69091TE5HWk0QxNyJj05oRoBe1W+Elk/6jPbbRF/lv0ne79+Q94z7/OvoEpopJbxJvhb9
	IOPqSLeuN8Exrjd52Twws4i4tuTOPsTdm87SZVk6hp7DipRdsmp8RvXYHJm9d3atnHMNjiNa+53
	qXANEdm14jzJjyc6F6RwNOTrzhngRFQTNapnRYyR0cJZprN1Zhqwhfx+zMYM+Sk6Y21VnszxuTP
	GYSF+/rR1+wcLI/vEs5BbPD/m6ehHmC7sTP0Z1w3itYNcK2XDu1vcTWp4HLBxDLEbIB14E82tWv
	9rqRVYMBVpY24fJ/
X-Received: by 2002:a05:6a21:47c7:b0:3e9:176f:ab86 with SMTP id adf61e73a8af0-3fe980f7bdemr4008545637.44.1795062444071;
        Wed, 18 Nov 2026 20:27:24 -0800 (PST)
Received: from x1.hs.local ([2601:600:a482:7d70::5e59])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cb35830bsm2077636b3a.33.2026.11.18.20.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 20:27:23 -0800 (PST)
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
	linux-kernel@vger.kernel.org,
	mail@maciej.szmigiero.name,
	nihaal@cse.iitm.ac.in,
	David Westen <davidlwesten@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net v2 2/2] net: wwan: iosm: fix S3 resume by re-binding the driver around it
Date: Wed, 18 Nov 2026 20:27:14 -0800
Message-ID: <20261119042714.505405-2-davidlwesten@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119042714.505405-1-davidlwesten@gmail.com>
References: <20261119042714.505405-1-davidlwesten@gmail.com>
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

On platforms where S3 cuts power to the WWAN card, the modem boots
again while the system sleeps, but the driver still treats it as
running. After resume its execution stage reads BOOT, and by the
first port open the boot code has crashed into the CD_READY stage:

  iosm 0000:03:00.0: PORT open refused, phase A-CD_READY

The modem then stays unusable until an ACPI reset.

Unbind the driver before S3 and bind it again after resume, as
commit 0b6f6593aa8c ("net: wwan: iosm: Fix hibernation by re-binding
the driver around it") already does for hibernation. The driver is
then torn down while the modem still answers, and the modem is probed
again once it has booted.

The target state isn't known yet when the PM notifier runs, so the
default suspend mode decides: the driver is re-bound unless "mem" maps
to suspend-to-idle, which keeps using the suspend/resume callbacks.
This changes behavior in a few cases:

- On platforms that keep the card powered in S3, the modem is now
  probed again on resume, which drops data sessions and recreates its
  ports.
- Entering suspend-to-idle or standby explicitly while the default is
  S3 also re-binds the driver.
- A suspend to S3 that calls pm_suspend(PM_SUSPEND_MEM) directly while
  the default is suspend-to-idle is not covered and fails as before.

Fixes: 1f52d7b62285 ("net: wwan: iosm: Enable M.2 7360 WWAN card support")
Cc: stable@vger.kernel.org
Signed-off-by: David Westen <davidlwesten@gmail.com>
---

Notes:
    Changes in v2:
    - New patch before this one: cancel the ADB timer in ipc_imem_cleanup().
    - Describe the changes in behavior and the remaining limits in the
      changelog, and say in the comment that the modem "may" lose power.
    - I also tried detecting the power loss on resume instead; my reply to
      the v1 review explains why v2 keeps unbinding before suspend.
    - Correction to that reply: the XMM7360 here does use MUX aggregation
      (CP capability 0x300), so the ADB timer is armed on it too.
    
    v1: https://lore.kernel.org/r/20261116031148.333990-1-davidlwesten@gmail.com
    
    Tested on an XMM7360 (ThinkPad X1 Carbon 6th gen, deep sleep) with this
    series applied to 7.2.15: the driver is unbound before suspend, and
    after resume the modem is probed again and comes up without an ACPI
    reset. Not tested on the XMM7560.
    
    The investigation and the patches were done with an AI coding assistant
    (Claude Opus 5.5). It read the driver and added temporary debug logging
    to record the execution stage around suspend and resume. We wrote the
    changes and the changelogs together, and I ran the tests.

 drivers/net/wwan/iosm/iosm_ipc_pcie.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wwan/iosm/iosm_ipc_pcie.c b/drivers/net/wwan/iosm/iosm_ipc_pcie.c
index 49052eb511ba..13e81012d818 100644
--- a/drivers/net/wwan/iosm/iosm_ipc_pcie.c
+++ b/drivers/net/wwan/iosm/iosm_ipc_pcie.c
@@ -534,12 +534,17 @@ void ipc_pcie_kfree_skb(struct iosm_pcie *ipc_pcie, struct sk_buff *skb)
 
 static int pm_notify(struct notifier_block *nb, unsigned long mode, void *_unused)
 {
-	if (mode == PM_HIBERNATION_PREPARE || mode == PM_RESTORE_PREPARE) {
+	/* The modem may lose power in S3 and S4 and boot again on resume,
+	 * which the suspend/resume callbacks can't handle, so probe it again.
+	 */
+	if (mode == PM_HIBERNATION_PREPARE || mode == PM_RESTORE_PREPARE ||
+	    (mode == PM_SUSPEND_PREPARE && !pm_suspend_default_s2idle())) {
 		if (pci_registered) {
 			pci_unregister_driver(&iosm_ipc_driver);
 			pci_registered = false;
 		}
-	} else if (mode == PM_POST_HIBERNATION || mode == PM_POST_RESTORE) {
+	} else if (mode == PM_POST_HIBERNATION || mode == PM_POST_RESTORE ||
+		   mode == PM_POST_SUSPEND) {
 		if (!pci_registered) {
 			int ret;
 
-- 
2.56.0

