Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795142562;
	b=HRvdTOrAsMeqWrgrl6sjKdCYEp3rFpCagRkIa39C+P36kYuqzPsFzE6xkeMz/rFv2+Lp
	 AYNlLDu7dJFRBs9r6K8eTx1cqv9RnMzUe9R/h5PudV+1HDoTHyeQloFFoj5tZIojref8o
	 9f+zCKWiu48Djzw8S1EcuLpbOZHkXBmIUpYBjGxTFpIsikE0gcRJnFkP1VfyhoPcE0ics
	 Naos/5WTf0NyZnchCb9nPyUPzahHAJL2t0Fd7XmzX02D9FzJtZcjPpx5SrJ4MyZFVFJyu
	 A7IZh+a9SdjkBZ+SLrItWudjj8mrgJP4vhugWM31b6mxQw/FighMEAwGbLfM2pslLqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795142562;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EF0vL6wEhy6tre/wASvym5RnC5jfEWcWyrd8wmWnmW4=;
	b=ASnpfrlOj05S0FI7EgkYsumB9padpmq4UgOdHTLkmdAc9yR/3UPDXst4OkqPP5bJri+x
	 MjjT89ALiClGDTX7VaQzyoDQ8CxRgJ1H8aKdO8iOo+/j56b+561fQ/iHCY8jpfzGK/5nE
	 GBYxQOu8znn7HrUXCJmE6y4smqvug+70ZqOFk4lmHdqgYl4+l18+Vif0kbI26qUuk7oPV
	 VX7/0CAmQfkVz0VM04HJdN25P9djAltg+RSG2Oh/MkhFTzCCINISoqIiT4WBmBNLmAwg5
	 z+o9BqPxFk7zCOJkzNsh7WG7bo3Kn+NAVEA2P6HNlJdoe+ESP+RamepjQpxoW6s320Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oe8qZ4cG;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A151606A325
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 02:42:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A151606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oe8qZ4cG
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cdb15cd8558so209380a12.2
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 18:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795142561; x=1795747361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EF0vL6wEhy6tre/wASvym5RnC5jfEWcWyrd8wmWnmW4=;
        b=Oe8qZ4cGxV9VAKGnbLuyaX0avd/zXFdOXXZx4Ib5GkdZtwkaUCefUHSJx/YCY37OGn
         2Qf4Zqp+948TZPyBytMhRn1Gba0nE7UEFENfwClnbZQEXLpduH/yOOkoQ+Go/HvI/y/1
         jTHzUKsknqsGF2AxdNV/cPXdKP11/keMLVuCycW8QadHU2KVXMUsurBqZWAWWWRTt3tM
         IDibg6hdCEwy2JKI4gVFMa+rosWzzV2fnvKlal/5KD30CtCl/0ukVYz6LbVO8JdApd9h
         qtLWdog5Vc3jT6nfXqQxFLYaTZbO33MC4aaTmh9CVh/pXJif4u2zBk3CZaUd1/CDUg3I
         CCdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795142561; x=1795747361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EF0vL6wEhy6tre/wASvym5RnC5jfEWcWyrd8wmWnmW4=;
        b=0VBD6KyspuEbm5knhbzJxaeq9vYgDiY5p85yLaGRyj4ca4EDOPk4jtrcz6f3tY8+A1
         fnIPNUzTtULKwHqOpZof4vquwwAzADP1p9xBSqrKR7OtJEhtdaPJgZh9haqconwG1uzT
         9fGsUbBG/IGvgySu4yXmjEQijgAim/vG5l7vG/JCPkF8UAh53bhlCmwWL9YWxDQojqNi
         zZ0d1XF6dKVtpv7ZEBpM6yaU2NJGlYKiTQMVvHKLj23btIiTWUQd623M1y+DjnPt7NVB
         lFvS01rJMTeAoq7LGvgu8keD/gjyNZJjJqGWPP9wqfnoKXc5ELAaeJPgujBDsWxx8X6N
         prDA==
X-Gm-Message-State: APuU4Z9p9uW0y0xEA4MITMQXkq4SotTMTTAkMsG+WBBSdpdnzA3+v6P8
	fnoD4Rk1/wxmFpI8AunGcFMrG+XNxPF6YbCtzX2chuvbcpv2g9PRDPCNP1+kULCr
X-Gm-Gg: AZFdTZebIZMeBqxTlVA74txG1zAX0dP1ZJizNhi5bQRAX6ZxHm7cKLlKd5kSv4B+bSR
	eHMukUx+n9MgHJOzAbqAL57sQhgBfDxPERwntg0VjaFOX12a8fERBD3aWOFN+i72vR7saXP/xc+
	/pGyn7xrkQKmv0dgfWz4aEt6DGPUtd/xo2kTkXGCGFULMSbICYlMRERVngeNNEfFI0bbtwsIIUM
	zFUjE1eVe/fV7pLyMwcbzvzBQ26Ew4imT9NivhuivYDCRBqiBxHyz7/AgZXetB2YJvS9DXBFVpD
	bScw7RWSsMsPzcgdbEmU4fMzIcG7DULgyiVu3glujw80nKIuqb7t9EuQtZoXv1c14A65L4vBkKj
	AMTNgdewROpANWA87o3iiLkARgJQPJKWu3m7H3dRVfYZFNDZOT5lFV3Gfhi+cBB0Sq11rD4XMXu
	8MXNJv/Z7H+tYm8jx2whjZqaXDM8p44ruoFOtbA9A9mh/rfPSMFQqrGfmt8OAFYqOtvziWPqnv1
	QxwYO3VmIbY9TGVfUOIq4YyI13gWdiiyvK/2i1xmIX5t3Apw8OG6YXInwfrkrFqR7xonhiNblH3
	VTEjsasDktXZTzfO5hNIomHC0W/7uYEPW4JzIEGAFXbO2D8R91I=
X-Received: by 2002:a17:90b:3d8d:b0:3b4:1982:473b with SMTP id 98e67ed59e1d1-3b41c98a120mr1116872a91.18.1795142561292;
        Thu, 19 Nov 2026 18:42:41 -0800 (PST)
Received: from u.. (61-222-64-201.hinet-ip.hinet.net. [61.222.64.201])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ffbab7fsm553507a91.0.2026.11.19.18.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 18:42:40 -0800 (PST)
From: Tim JH Chen <tim770802@gmail.com>
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org,
	chandrashekar.devegowda@intel.com,
	haijun.liu@mediatek.com,
	ricardo.martinez@linux.intel.com,
	loic.poulain@oss.qualcomm.com,
	ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	sreehari.kancharla@linux.intel.com,
	m.chetan.kumar@linux.intel.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	tim.jh.chen@wnc.com.tw,
	Chih.Hung.Huang@wnc.com.tw
Subject: Re: [PATCH net v7 0/6] net: wwan: t7xx: fix TX push kthread soft lockup on suspend and RX stop issues
Date: Fri, 20 Nov 2026 10:42:32 +0800
Message-ID: <20261120024232.133708-1-tim770802@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179514018050.3291.12379298766410717361@kernel.org>
References: <179514018050.3291.12379298766410717361@kernel.org>
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

> - Whether the issue was actually triggered, or is only theoretical
>   (e.g. found by LLM and not proven at runtime). If it was triggered
>   please include the symptoms, like the stack trace or kernel messages.

Per patch:

1/6: Triggered. Soft lockup in an s2idle rtcwake loop (SIM registered,
ASPM L1 enabled) on 6.19 with the unmodified driver, on the 981st
cycle, captured with kdump:

  watchdog: BUG: soft lockup - CPU#4 stuck for 26s! [dpmaif_tx_hw_pu:764]
  RIP: 0010:ktime_get_mono_fast_ns+0x2e/0xe0
  Call Trace:
   ? t7xx_pci_enable_sleep+0x44/0x90 [mtk_t7xx]
   t7xx_dpmaif_tx_hw_push_thread+0x1f9/0x490 [mtk_t7xx]
   kthread+0x10b/0x220

With the series applied, 10024 cycles of the same loop completed
without a soft lockup.

2/6 and 3/6: Not observed; found by code review. -EACCES is only
returned while runtime PM is disabled and the device is not active,
and I have not seen these paths hit at runtime.

4/6: Triggered in the field, reported by Andreas Haerter on the v6
thread (Closes: link in the patch). After "SAP suspend error: -110"
every runtime resume failed, the TX push kthread exited, and a later
write to the PCI remove attribute crashed in kthread_stop() with a
NULL worker_private and then hung in D state.

5/6: The symptom was triggered, the exact path is not proven. In two
overnight runs on 6.19 with an earlier test build that did not have
this patch, a modem exception was followed by closing the wwan netdev
hanging in napi_synchronize() with rtnl held, and every other rtnl
user hung behind it:

  NetworkManager:
   msleep
   t7xx_ccmni_disable_napi+0x42
   t7xx_ccmni_close
   __dev_close_many
   __dev_change_flags
   netif_change_flags
   do_setlink
   __rtnl_newlink
   rtnl_newlink

The not-started early return that this patch fixes is the path I
believe left NAPI_STATE_SCHED set, but I did not capture the poll
itself. With the patch applied, "Work RXQ: 1 has not been started" was
logged twice in a later run without a hang, but no modem exception
occurred in that run, so the exception case is not verified on
hardware.

6/6: Not observed; found by code review.
