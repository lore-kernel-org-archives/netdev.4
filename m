Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794798739;
	b=HY1G47gMKcttCRYEnsAsjiwI1YGYMVwDOjHaJinUdP3GL/xw6a+yvyoyKooRHKPALsMo
	 5wIivCbNpm1pSaICKi8LcwtxHkFarrGLengMqVASmIG6Wz90QvlpXD2/PDqi/ReoLpTCT
	 jIU8WxwA+4reN1c1WfciWWuSAqM+Mg5rlVGLONnG03dzranOpvqbZJvzGQaHQmaVp5/h7
	 bupbSKhC1BqunJU8PQY07yu7DvcCowNlwYO69wVIh+izypKOiakFoflf2ktg6AMoP69/B
	 FoMEWeyobsgCCaJQ4JENcx7KFhoS6c7atA/nAsseHXb/Ox4o4+uyLn/3VyrHXOHfosw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794798739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=dhVj9s9zFV+DbHl3yJ+maZv5fyr6B5MvtTW09b8JDGE=;
	b=0g9dwv0hrCnmtK6DqjfmRIz+kyd+iKLQKgYpgVkt9+ty9mI/Czp+ovTxGo0+SkI4vYLs
	 IErjMQ2T4COo33BA+XQuKtNNRJ4VeSgg4oeyYYZ8irSAsT+brObkZ79B2NqsRF0o2YU+t
	 qD/6dpVXA2IKwRVu04cxQ4c69D3rKMrxlrvwVfP3Jgj/F8UJLos56/v9UgxNu/kAJIDxt
	 ZrAF+7OpGIU0ARcgMt2tIIE7eFF7lGQ9+KozomL/RVSOqHfYiVXum2GtuQJ5fbS7dEQtX
	 2sdfD3Kd0aQ4SviqgqGOv5Iq+xeDR4EIUerLertX8+qkFqxwrXjeAiX7Rk7RFDs6GOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="tGbI3/06";
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A300606A321
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 03:12:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A300606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tGbI3/06
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ed06b725fdso26623315ad.0
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 19:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794798738; x=1795403538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dhVj9s9zFV+DbHl3yJ+maZv5fyr6B5MvtTW09b8JDGE=;
        b=tGbI3/06I/g0J13gmiKUMJPY2XMQCypJkTiVTXYaK08BweI4+sOQ5WdvQ5RbB4ffXf
         Ej9Cps7spxlMhpru/xJckAW2Der71gTsOBV7yjgnDnQhZETaBa0HApmvnBrJdJEzvBRc
         GksXV7EqCa1QuppEluZ0SYb4OHMAzdFbWZ3pRCgo/cPXVhSG4147sIX22V07Zk2MOSq/
         fkurgw7PAqpTaWYlDL++YMuy8WWy6bed0NVLKoSYVVtXEHbPPUdJhGLEX+T3vW9Eei3G
         arGzFKrjwlT9u6YMIkPCJMWhIWhj0afYSMGdO8tx1XsZSCUOKssB+8Yd64auF25OSy1E
         T7TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794798738; x=1795403538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dhVj9s9zFV+DbHl3yJ+maZv5fyr6B5MvtTW09b8JDGE=;
        b=oFr/66zQdce5CbWS/S2H0MX562qhe1j6cUJGcN2j4FIiTN6uB5B+VbwQ56mMFp1Pcb
         oUBFh3wvPYfGQ0snRaUDfgaMEp0TwqCd1ECrLSio2MHI0I9g77RqteBQ8n4uUX33SAoM
         bOdZOf5QIwWWS+gt4NytMYL4OomcnAovYP7MBcgcNvrX3Lir4clpqm6m19nx9XaopRYz
         rVJwNF4kLpwTEymtsSle4V59jD39b13EhWPVpZ7Ev9S88LdhUdpxCCnTj9xlM8kb4uqs
         mGW4YqPT+OU9A8sYobuqQ7+DYv1/SFHJ3hUT4oQJrKYXGdzb+hdODhp37FVmCfR8ry1h
         c3uQ==
X-Gm-Message-State: APuU4Z8Is0OZJHxSdD33qPCTXirqOFSWd2EvJBvKvKQScT+K9iSZlkef
	Sf9Fc5W89uAm9JqOZlC29tWMqKLULoG7jNUKAGXG5KuRXCHNHEvHUyPOEwwW+ff955A=
X-Gm-Gg: AYBFou2lCx6ujWRg8LdVQxoh2jpEjQyT3qTt0PneV4Fp3c8sMYqmJkPb7CXbD3SgA6i
	pvz8Era5QPt9Jdx9oc4ifirrVcxn/daRLrUDWO+VlVu/wVb8LRiPO8EpAiMS6xzVCU+ScQSmhFP
	On79TDkcqLbTWnUmoHRb3S9Zvw6KgGy6CdKRyt6aCiinTvEVn0e6ITkU+dBnP1Gs+iHmExt1h5a
	0OUfWp8E9FIDWv+Afyp8YGMZ7R/M73LbsrvDmjrO9KaMVWOKLaY5aXwy3f9B9LAXs2xP2UTCyxO
	TyoBKFcilz4YDJfSBn8zOhEyZUNFSiiYB5GMwnj1NJCAV9YlWopFt+BwmO8JmuTdkJqPjPgld5U
	vm9WO7wbDprN1J+0jnFGSS2xnstxrCQL67uXmGzCoSlPIFY3f6+AQrHdKxCYIialvdWIkdIJM/n
	f9OFRmoOZrPL0T4X9vG5MOdehWb6ipK/Jn59whdheAMTiWGyvv4xrjXHbNo1ygzsBB9vI2O/bHa
	EuJH+gXVlA8tuvfbl21f25ui/nzXUrAtn1d9hthYi1M8bQLaMhiEbLhoLOBF9xy7bTVN+vXvURN
	4tsbYb7W10y6YNoXtceNhk5kRfBA5Z6P
X-Received: by 2002:a17:90b:184b:b0:3ac:9ed8:f301 with SMTP id 98e67ed59e1d1-3b1b0ccf45cmr6223470a91.30.1794798738434;
        Sun, 15 Nov 2026 19:12:18 -0800 (PST)
Received: from x1.home ([172.56.107.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f8dc859sm31238405ad.59.2026.11.15.19.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 19:12:18 -0800 (PST)
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
	David Westen <davidlwesten@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net] net: wwan: iosm: fix S3 resume by re-binding the driver around it
Date: Sun, 15 Nov 2026 19:11:48 -0800
Message-ID: <20261116031148.333990-1-davidlwesten@gmail.com>
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

On platforms where S3 cuts power to the WWAN card, the modem boots
again while the system sleeps, but the driver still treats it as
running. After resume its execution stage reads BOOT, and by the
first port open the boot code has crashed into the CD_READY stage:

  iosm 0000:03:00.0: PORT open refused, phase A-CD_READY

The modem then stays unusable until an ACPI reset.

Unbind the driver before S3 and bind it again after resume, as
commit 0b6f6593aa8c ("net: wwan: iosm: Fix hibernation by re-binding
the driver around it") already does for hibernation, so the modem is
probed again once it has booted. Suspend-to-idle keeps the modem
powered and is still handled by the suspend/resume callbacks. The
target state isn't known yet when the PM notifier runs, so use the
default suspend mode to tell S3 from suspend-to-idle.

Fixes: 1f52d7b62285 ("net: wwan: iosm: Enable M.2 7360 WWAN card support")
Cc: stable@vger.kernel.org
Signed-off-by: David Westen <davidlwesten@gmail.com>
---

Notes:
    Tested on an XMM7360 (ThinkPad X1 Carbon 6th gen, deep sleep) with
    this patch applied to 7.2.15: after resume the modem is probed again
    and comes up without an ACPI reset. Not tested on the XMM7560.
    
    The investigation and the patch were done with an AI coding assistant
    (Claude Opus 5.5). It read the driver and added temporary debug logging
    to record the execution stage around suspend and resume. We wrote the
    change and the changelog together, and I ran the tests.

 drivers/net/wwan/iosm/iosm_ipc_pcie.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wwan/iosm/iosm_ipc_pcie.c b/drivers/net/wwan/iosm/iosm_ipc_pcie.c
index 49052eb511ba..ec27d6fd7910 100644
--- a/drivers/net/wwan/iosm/iosm_ipc_pcie.c
+++ b/drivers/net/wwan/iosm/iosm_ipc_pcie.c
@@ -534,12 +534,17 @@ void ipc_pcie_kfree_skb(struct iosm_pcie *ipc_pcie, struct sk_buff *skb)
 
 static int pm_notify(struct notifier_block *nb, unsigned long mode, void *_unused)
 {
-	if (mode == PM_HIBERNATION_PREPARE || mode == PM_RESTORE_PREPARE) {
+	/* The modem loses power in S3 and S4 and boots again on resume, which
+	 * the suspend/resume callbacks can't handle, so probe it again.
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
 

base-commit: aa40afa831ebfe45e40a23721711059f2ac584d4
-- 
2.56.0

