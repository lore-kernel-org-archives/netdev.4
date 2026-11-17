Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794927343;
	b=vC+qFhL7MiWCjSbq9XMa/fq5tZdTSqzl/Z5do502DK5tHo+VDIRDDK0pBnkw0gw/EBQW
	 FVmLHBIQIMhjkiBtKdmtvNVQyuIx1KckW9PlRUSJP2TNym5E5MvrfEWe6LsnvX0XA96r6
	 v/sfGrluJQkX+4uu+RDkD0FWUgx8g3h6gyfVmfS+t8QXfNNbsN45ASlqImy8+ZBkfJnTM
	 w6GkTUGBK8APDwAs/blBlcmyEWKp7dxYgZf4sFBPsG0Wo8brXmS4Utdk0SQLEK+Ncv7DO
	 n1dDfRQ5tzzP5SN5BuwWmgpwUA2mmPABgB1yBavVh+FEUAmw+bTnlhOL+I4VNjNA5Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794927343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=HLnUN4SFxuLePJET60hqALFh8R854ScCCjNPuZCVkMs=;
	b=XyFhD5eAhCQ7zVd/DICH7ArQ9Zir9msjhwesfuzwrouM7tsoGe//dxuBHbkGxs2Fy7l5
	 IWyohH6Xdoh57Oi8ETPhSwIBxAgvaGedWhBwktNmOiJvTav+NQsH45dcNdtHkfmw+MLKs
	 vhD639V8EwcEVWWvNXA++Uq4kB1KAHAvwBlUro3oj174wuSWLgjNgZef3ZsUtaGu+oHWZ
	 0sDGRINYzK8cVAecV06okagblnGwLTVPap+0oPtvUR9cG0rCSqQ1u1RwGNjffx1ksb6e+
	 yxbjrBp5EYxmbC8/175XtX2ymBKl6WVX2hjACI/ZPZxSA05GEenwycgbXAT/rzHoJhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stani.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NvdE1A0h;
	arc=none smtp.remote-ip=209.85.222.198
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B26606A896
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 14:55:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1B26606A896
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stani.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NvdE1A0h
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9495c71055bso653773585a.2
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 06:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794927342; x=1795532142; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HLnUN4SFxuLePJET60hqALFh8R854ScCCjNPuZCVkMs=;
        b=NvdE1A0hxlUkz6GJhAxddDB40AtROW+rNaSpm/1Bf+iC67LrFamdjIgMurLaP1pOLb
         QUANGGF7o/pvk8tuIHbLsNjpP+G/aGHAWb/1bBZ/ocg+69WIP5fuIobG5Y5WChPDTmV+
         XUXX+C9ObvQY3s9Xj+FH13NdOg+uvXpJbzLdsdVhPcHurDgZw/jsCZqAGpLUao75Dt/8
         /EVVaO9avdpREJX7Ti4kyitwcyLe95+z4wNGyxupNPwpEIz3StA65jrBX0AbsnPlQlfc
         maw0Gnv+ENPMzDvWUinYtG2Im2yeB2QFAE6nrc368MdGpMv+6/AYtHCa2WV31fQgzcc7
         NDoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794927342; x=1795532142;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HLnUN4SFxuLePJET60hqALFh8R854ScCCjNPuZCVkMs=;
        b=yHbMX83BsVGwdWEB1DR0t5yJTR2AETcZa1EsmFypbt4VmzGb/JadVfv45sfX8tx+hZ
         yLFZTzdfWkAr7bAAPFSK5xpVGZBqOSdMmLDyrMAQ65zilnKvs5HOT347EvkWW1l3/UXj
         66/G2CKmUN8VZaX0S5l3EKFom2C5hth+CjNGE3CLdb3pnBT67uu/JlI40Vtgq3rm6mi3
         9XKS5SQPSIkY2ur2/CfFJVJuxFbjWc+pGpGlQvDhLjSHs988rYmglvX2ylNSRFGXWSxp
         VzN6RpF4p3cCqhuHIEjXWuqHleF2+j5DvRnk3/ImRx8WuJ4uhwpuPm5UTPgsL6AlU10R
         9MBw==
X-Gm-Message-State: APuU4Z8rNK3LfnmaWfXvenCUTl/wlfS/HN6n1ud45NhkfDXCpmqhM5e1
	rb83gLLaD2PbEp+/UhF1WVIuQt1BjGkqBmeHKYIRoVN04CquplPX9DNl2p76mSB4u/IXfVgQS3G
	Cjg==
X-Received: from qknvm11.prod.google.com ([2002:a05:620a:718b:b0:93f:43a4:a480])
 (user=stani job=prod-delivery.src-stubby-dispatcher) by 2002:a05:620a:bc7:b0:944:1291:6cd9
 with SMTP id af79cd13be357-9494bbeb488mr2333610585a.68.1794927341308; Tue, 17
 Nov 2026 06:55:41 -0800 (PST)
Date: Tue, 17 Nov 2026 14:55:09 +0000
In-Reply-To: <20261117145522.1910636-1-stani@google.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117145522.1910636-1-stani@google.com>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261117145522.1910636-4-stani@google.com>
Subject: [PATCH iwl-next 03/15] idpf: make the mailbox workqueue visible in sysfs
From: Stan Iliev <stani@google.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, intel-wired-lan@lists.osuosl.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Decotigny <decot@google.com>, Madhu Chittim <madhu.chittim@intel.com>, 
	Emil Tantilov <emil.s.tantilov@intel.com>, Sridhar Samudrala <sridhar.samudrala@intel.com>, 
	Brian Vazquez <brianvv@google.com>, Li Li <boolli@google.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Daniel Zahka <daniel.zahka@gmail.com>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add WQ_SYSFS to the mailbox workqueue: the workqueue attributes are then
exported in /sys/devices/virtual/workqueue/, e.g. to inspect or change
the CPU mask and the nice level of the mailbox workqueue while debugging
mailbox latency. This is one of those cases where, when the need arises,
we wish we had that flag enabled, see https://lwn.net/Articles/967016/.
The PSP workqueue added later in this series sets it too.

Signed-off-by: Stan Iliev <stani@google.com>
---
 drivers/net/ethernet/intel/idpf/idpf_main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/intel/idpf/idpf_main.c b/drivers/net/ethernet/intel/idpf/idpf_main.c
index c855572c5315..566d5804c8c1 100644
--- a/drivers/net/ethernet/intel/idpf/idpf_main.c
+++ b/drivers/net/ethernet/intel/idpf/idpf_main.c
@@ -319,7 +319,8 @@ static int idpf_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		goto err_serv_wq_alloc;
 	}
 
-	adapter->mbx_wq = alloc_workqueue("%s-%s-mbx", WQ_UNBOUND | WQ_HIGHPRI,
+	adapter->mbx_wq = alloc_workqueue("%s-%s-mbx",
+					  WQ_UNBOUND | WQ_HIGHPRI | WQ_SYSFS,
 					  0, dev_driver_string(dev),
 					  dev_name(dev));
 	if (!adapter->mbx_wq) {
-- 
2.56.0.679.gc527c65306-goog

