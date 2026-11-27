Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795751341;
	b=CBSERqYaeSkGedGnlCPR5YybdBb3yP8qp2WoHy6xvb+GnPzTYF8VPXFxqvTh6c9HQL9r
	 Xitl1wlDlgbbLjHOAqtJpSCqoMAud4A8Ln4XK/DpswaLMsyuyhYU3MgljH964Y9nDhI6q
	 iejAAl/lhm16LJeflsCV9IJfW1HSoJOt0Fcz7zPCAsz72AbEHzHWUCwPvj1MHXPzJCvZ4
	 b7b/JzkBNkUP1EJFcv2RjEhWtViyW9FflmXmZzsI5iGiDn1o4JyLKWqRISskERjYGvrnP
	 DgU0awduQyM5dtnYi3kLeP4CBQO6rZW0n0+XGI4a3XuYWvUWyx3GFQl5w5NUlG4wXzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795751341;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=trk7EafvD1eXhdYDrd53I6qHbEre+Htjda03k5B4LzM=;
	b=syQoIJ7cGagkWklgZOO1QlVgVxAKPRLnLqtPBzD+eiXTHN1eXe3pvvmFK6A7jeVP5vuk
	 Ck8qXc1KG0TTWF/AtiCc+TrqoxfIeBsWqVj88kDBwwShUOyGaFPxiwFkKIuU5/dTayx/W
	 ghBLn5+4FQTatEGE9ZPmsVN8dmNf1goITO7b+zpCanpvjrnEs70XSlA0YO5IgnpK4ltcf
	 q72RDLCjOK3LSXdJu7vyhEldT/ReiyHRmmvuyK8ZiAcu7ft66fshIZ8r3VHU5sY4Ovfeg
	 AWLU+pyM2rUN9Jjn8HGDDzk/ThuNKzj4kUpJ8Fiq+Ig9sk6JoY+dsRpw9DlpOpk2+2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TtINA7k6;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03F2606A31C
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 03:49:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D03F2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TtINA7k6
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2f04b676219so42013105ad.0
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 19:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795751340; x=1796356140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=trk7EafvD1eXhdYDrd53I6qHbEre+Htjda03k5B4LzM=;
        b=TtINA7k66/JTy52Wsflt/rD+8s2QK4P6fsV7RwjOslYR8lofd7yF3ifCzGt1c3RhLn
         zRDeuRP6DhzVqyrVZ17dxTHYRdi8mtJDOhmB3qgsxSvGYU802ne6XEABFSMdkdRox4Ir
         p9O6HLvaYaaRNkd6dteML08aYJb0tVPKjBSrbA0ZKfKuY+lovVmF8zeGnGROFO9/oYX8
         osuPO4ADwYFfoAn49pi+09J6my80g36OryzfwwnuZN4W4lmIcyVjxalJGGVtxLipPrfc
         DR6wAQhz/8YttrUHxPEQLEeGgl36AC5qrmSeBKVW8O6oW74VamZcP7wJc8N1zN+FPkMa
         bFLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795751340; x=1796356140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=trk7EafvD1eXhdYDrd53I6qHbEre+Htjda03k5B4LzM=;
        b=J0fvIzkg99r/uArWny84CrJZWRIrlt/YwxIBhEeF1PMZyUovV+rDLFL47apqvoPHBy
         5EPf0D18+vQatvJWPoqPHIJhsXGbQFoxez0PkrspXU2nPYPXBRSAPnNoZlythTVDSVx3
         7qyoc7ipreaQjJTuHVRFOUexAVBTPUPboun8i0TlaUeQui44CSopEQ1PlAFqri4xKFBX
         DoNsU8DKt6nq00NEsgEpUl31awXZZO6w6f1zxb6WPfRBrZ87kbCnYhkb4Ei2sIbOZ4ym
         eRY03QGSg9xr/7xZlWAoIU4aHGTiu3WN8uqHUvT8jPCes1nZQABf6DRfOgvU2dsJaL/E
         6qJg==
X-Gm-Message-State: APuU4Z8BDdPoSnLjCa3cxKusMZYqi1gNp3b6Qg1dO3jnh0L+1YhQkPZY
	itGSDd92fkF7R/lfHY5+Kz4Do0L7B0bsYFaPxtXPeYDFhEtNxwaLgOVryx/s/kL5MvY=
X-Gm-Gg: AZFdTZdhxo9P50CHT15yyD5jHWY1p/lcS6FWtQGFD9O+oToQaQf0vBIJSe4qM11elif
	xqp91+HACnMkeX4KVvcdAvF9Glc9U7Ymr7Rchx3B4PK50rjfoIav46oD1yYj2hfr04MFZ7LhrGT
	DiMhCmVzGbq4AnXCmdVZiS57IizJUVqdNKh4PlJZIcdMO8hhOQ5uoorHMr21Aj1BzpyRzTasmE5
	e3GLvXyKvuRU2UT1DccdePHvsNo8xmdlCeRLiKI8aLb2CsKyqs0PXj4/j3/70pUxG99L/5xHciH
	gHBp+KhqmODe/eqJjWCkvyDIStOa8PRrmwlOvnmhpX8/pUG5Vm2l5HflRtZ5eoWiNRq6uzNVv7e
	ElfQYx7QHoLtev+y2nWGup//Jeuju3vKkTA1WF3taH4wDQdUcMvhe79+fryUkyqPvOsyUNKgQMS
	cmyj33re7vg/XiCemeEo550nTzBJ9E5I0mZj1nJ2KG4Z5ZIYhCSZ7ZoSt5VayGTEj0Bek0ClXuc
	sAIfwMnACvm+lnLjHPadPsRsM9yn8CIyTjI8wLJCuXBz9cxWcs/rYSk3ww0elv1NAw3Ufmj4bTo
	/ls22ovfTfD3G1IRIYAnNXl6VScAT5g/
X-Received: by 2002:a17:903:1c9:b0:2ef:fcd8:df75 with SMTP id d9443c01a7336-2f03f18847fmr252486975ad.36.1795751340073;
        Thu, 26 Nov 2026 19:49:00 -0800 (PST)
Received: from x1.hsd1.wa.comcast.net ([2601:600:a482:7d70::5e59])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84364sm114017875ad.5.2026.11.26.19.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 19:48:59 -0800 (PST)
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
	David Westen <davidlwesten@gmail.com>
Subject: [PATCH net] net: wwan: iosm: return the callback result of synchronous tasks
Date: Thu, 26 Nov 2026 19:48:49 -0800
Message-ID: <20261127034849.11770-1-davidlwesten@gmail.com>
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

ipc_task_queue_send_task() is documented to return the callback's
result, but returns 0 whenever the callback succeeds.
ipc_protocol_msg_send() uses that result as the message ring slot that
points to its on-stack response, so a timeout clears slot 0 and leaves
the real slot pointing to the returned stack frame. A late reply then
calls complete() on it:

  BUG: unable to handle page fault for address: fffffffffffffff8
  RIP: 0010:complete+0x9c/0x2b0
  Call Trace:
   <IRQ>
   ipc_protocol_msg_process
   ipc_imem_tq_irq_cb
   ipc_task_queue_handler

Return the callback result. The other callers see the same values as
before.

Reproduced on an XMM7360 by forcing pipe open and close timeouts.

Fixes: 3b575260cb86 ("net: iosm: bottom half")
Signed-off-by: David Westen <davidlwesten@gmail.com>
---

Notes:
    The bug was found in an AI-assisted review of the driver. The
    investigation, the test changes, the patch and this changelog were done
    with an AI coding assistant (Claude Opus 5.5). I ran the tests and
    reviewed the result.

 drivers/net/wwan/iosm/iosm_ipc_task_queue.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/wwan/iosm/iosm_ipc_task_queue.c b/drivers/net/wwan/iosm/iosm_ipc_task_queue.c
index 7cb2f6a506d9..069075481825 100644
--- a/drivers/net/wwan/iosm/iosm_ipc_task_queue.c
+++ b/drivers/net/wwan/iosm/iosm_ipc_task_queue.c
@@ -162,10 +162,8 @@ int ipc_task_queue_send_task(struct iosm_imem *imem,
 			copy, size, is_copy);
 		if (is_copy)
 			kfree(copy);
-		goto out;
 	}
 
-	ret = 0;
 out:
 	return ret;
 }
-- 
2.56.0

