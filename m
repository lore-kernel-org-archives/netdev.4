Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795722110;
	b=rCe9Nj9aSku1XNnnfuOH+pYEwXdgwKluQJ23T48u5HdQ5sdT49E5WjGSPgj44dePXbGy
	 I5wD/7X1AR4ldUgF6kTCqphcV9OqWxvp50uB8mPXN7Q6mcM0Efy6Uv4ctBDwWWecN9fkb
	 u5fXQR3JWy9sYfXw74FukU+JoSfrAvgvajTWoaRZ0HGe12RlUdKHj6PAwbY8JtUms0H5a
	 G52hwcTGlKhdOsGpezVq5ZIfwofYNnoGakVgJvtVkh6SNvwoB8WWc+ytbW9WfmA+cL+9+
	 2u+D9PbEk8vm0jxRVAUvhXgret82oHiRdPARBHNsAWDwrp/91CE8rbJ8ken/oYfcMjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795722110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oSGSUlcjM0/qvwCb+O/SigLvtDpjuDLTupcmbWWxT4Q=;
	b=j0ltfTyltoZM8KjPPCdHa8Jzc1CzYCD0D7X6CYG+KEEBK7egrtgwNWGYbEyQ/1yDDCT1
	 ODp2Lg3wP7o4oQmqONKBS18jUr88AsazV71ecyS97hrk6nug7CWsoutCFb23sLkQRRDh1
	 HQhHTW+d1vRCfP96qKv86ojt9OJxX3P80+mfyiHqsk7ccS7saG0au8bsx7+FawM+GHJMB
	 njxuREYxImk5tdZ92PyMAcKT6x5C3BezdfmAs33UcZLP1ICjZdtA2sFpcFEcP/oHkadwU
	 c/+rPk3KJ24DC7+vd/+kRobfrdMMGSZwfwaakXA2gbxNe3o5DO1mPCEI6tvP0xFWSrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vexuYUkf;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C457F606A329
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 19:41:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C457F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vexuYUkf
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8b5c3288e6cso2994036b3a.3
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 11:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795722109; x=1796326909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oSGSUlcjM0/qvwCb+O/SigLvtDpjuDLTupcmbWWxT4Q=;
        b=vexuYUkf/s96rcKOcMgDCJzaBb5WAIh+pdlcv1Er177JP2oU1w2gyAVwZmzuikpN55
         1UcsnggbKk+IUpvEFlMDp7H1ePkVp/bx+2bM06j+ot2SOd128P4BSS1HjkEjsktrD0oq
         Jc1QoKGpFTGTa1Y4DD279FyH8mK5mRmm/qImhtnTTV6D4O2oanW2qs+AbRe4qUC6aj+B
         VREXsCsOHbT1GyqGLEuAG1gtjNu4FiVJsLbsShYsJq3rWY1wnmr+7lJ6kxfD29dJ0j5e
         exotFUjOKzdW+yVM3z5GIUufwlc6nbrDNXqaf1GiuHoScSaEsEfT5HXJAiJ+9YbuM3j2
         scag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795722109; x=1796326909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oSGSUlcjM0/qvwCb+O/SigLvtDpjuDLTupcmbWWxT4Q=;
        b=T3X9iFaoWDykjenI2jBH+KH3mK/2q819sUYxktQ25UOEANdNRlL1Ei/epVe9bT2MW6
         qNm4D00pBOOLFXPcAr+fI9KWJDcBPtu0vKxRQugAOsDKjEQrUAzNi03p1omPd6WU/ATi
         8STVK57JVqrznz1VpFUnOUm6lRBEJx82NNeN0oToZ1YeXbY1eWhY5BcS2vlug5sCNZs+
         qfJoKeA5Y11WEYbS7lnUrYb/NvOS0doGA8dcl2VEf93UFs85F0mUn5DXisdnGa0XiUR9
         FGdI7XbitjAiOYPY5PWc/kI4dOBAF3QTJZLKY1ecF6LHLQFjI679Ux/kzfkVztXZ3Wky
         e5Fw==
X-Gm-Message-State: APuU4Z8uHaxZtN9s2ExTupQsEV5vkNl487w2fg+ehKmYuXnmXWoXez1m
	KYtByCV4ebq7VrAQtIn4pqKZ3a7zwXi+dSo2lDMuO2PK01VPUP+cI+4fNT9AXfsyftw=
X-Gm-Gg: AZFdTZdkV1uc0Kcz2ZojeGJfgrh2RDa39tYfhsWClPaQyzAc3A8C9PUAozY6o8yYo/x
	ahRa6bA18rP6x/e0FLCcHVKnSvF5Hx9R9m7ylvbnb4oLfq0qq673jzim+ddMDBQsWxHjGPznjMF
	mackEMAi8i6Z5F1CfWmly51fQ06ZoZEpJZWspjLx1Dj0kNXnDRfeUGhO31thq0lEG63naQ4iV7s
	ijj4CUzAtYiHrQufZmisYtvsl5DrFqqfgXoe2H2dXO6RKg99Mc7QP4GgVCDmTbdCa+D7eW4iW2N
	0WNEiC5LGHgdElfRLBeuDwII4NUEgVTzDm4312OQ0Wosi+ORJ46AdT1PHREv9OcG4EELlwIssqL
	XFmwQDPXiACykjAKLE8rvtB7CLlxW9Pa8x47Wvjh7EIq60mW5SFxm3oW8uvYsvt9fk27Bdehc70
	CLx0QP1kJCMcG5fQz06waIKCUxNxpsaclUDOnosj7pZMuv5QqHrF9OgrYfL3ni/M30s7YLcFROe
	Lr3QDp7QLAMbe9Ce01qQ9fSCb602HkRn+KzIjK6Uko+Rw6ZF8v8xxrJMAACt3LVGgAHNrY8KBfr
	nKtV7Odsx6XYnphd
X-Received: by 2002:a05:6a21:9d8a:b0:3f9:a7b4:d09a with SMTP id adf61e73a8af0-4014e853ffamr22223505637.58.1795722108992;
        Thu, 26 Nov 2026 11:41:48 -0800 (PST)
Received: from x1.hs.local ([2601:600:a482:7d70::5e59])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873442863sm11370474b3a.43.2026.11.26.11.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:41:48 -0800 (PST)
From: David Westen <davidlwesten@gmail.com>
To: netdev@vger.kernel.org
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	M Chetan Kumar <m.chetan.kumar@intel.com>,
	"Maciej S. Szmigiero" <mail@maciej.szmigiero.name>,
	David Westen <davidlwesten@gmail.com>
Subject: [PATCH net v3 1/2] net: wwan: iosm: free the MUX after the netdevs that use it
Date: Thu, 26 Nov 2026 11:41:42 -0800
Message-ID: <20261126194143.32283-2-davidlwesten@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261126194143.32283-1-davidlwesten@gmail.com>
References: <20261126194143.32283-1-davidlwesten@gmail.com>
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

ipc_imem_cleanup() frees the MUX before it removes the netdevs, so
closing a netdev that is up uses the freed MUX:

  BUG: KASAN: slab-use-after-free in ipc_mux_close_session
  Call Trace:
   ipc_mux_close_session
   ipc_wwan_link_stop
   __dev_close_many
   wwan_unregister_ops
   ipc_wwan_deinit
   ipc_imem_cleanup
   ipc_pcie_remove

Free the MUX last, after debugfs, the ports and the netdevs. Closing
the netdev then tells the modem to close the session, so that it stops
writing into the MUX buffers before they are freed. The reply is
ignored, as for the port closes. Ring the doorbell for the command at
once, as the cleanup has already cancelled the TD update timer.

Reproduced with KASAN on an XMM7360 by unbinding the driver while
wwan0 is up. With this change, three such unbinds show no report.

Fixes: 3670970dd8c6 ("net: iosm: shared memory IPC interface")
Signed-off-by: David Westen <davidlwesten@gmail.com>
---
 drivers/net/wwan/iosm/iosm_ipc_imem.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wwan/iosm/iosm_ipc_imem.c b/drivers/net/wwan/iosm/iosm_ipc_imem.c
index 4405c8531888..3ab409166c50 100644
--- a/drivers/net/wwan/iosm/iosm_ipc_imem.c
+++ b/drivers/net/wwan/iosm/iosm_ipc_imem.c
@@ -178,7 +178,8 @@ void ipc_imem_msg_send_feature_set(struct iosm_imem *ipc_imem,
 void ipc_imem_td_update_timer_start(struct iosm_imem *ipc_imem)
 {
 	/* Use the TD update timer only in the runtime phase */
-	if (!ipc_imem->enter_runtime || ipc_imem->td_update_timer_suspended) {
+	if (!ipc_imem->enter_runtime || ipc_imem->td_update_timer_suspended ||
+	    ipc_imem->phase == IPC_P_OFF_REQ) {
 		/* trigger the doorbell irq on CP directly. */
 		ipc_protocol_doorbell_trigger(ipc_imem->ipc_protocol,
 					      IPC_HP_TD_UPD_TMR_START);
@@ -1244,10 +1245,10 @@ void ipc_imem_cleanup(struct iosm_imem *ipc_imem)
 	cancel_work_sync(&ipc_imem->run_state_worker);
 
 	if (test_and_clear_bit(FULLY_FUNCTIONAL, &ipc_imem->flag)) {
-		ipc_mux_deinit(ipc_imem->mux);
 		ipc_debugfs_deinit(ipc_imem);
-		ipc_wwan_deinit(ipc_imem->wwan);
 		ipc_port_deinit(ipc_imem->ipc_port);
+		ipc_wwan_deinit(ipc_imem->wwan);
+		ipc_mux_deinit(ipc_imem->mux);
 	}
 
 	if (test_and_clear_bit(IOSM_DEVLINK_INIT, &ipc_imem->flag))
-- 
2.56.0

