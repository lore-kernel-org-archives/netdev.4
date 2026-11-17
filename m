Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794927342;
	b=JbiN6qxISa5WEQPQBPR27cyD11B3arD79qB7VJez+5Lt72onOO7Z02cPOzV+vWeO56qf
	 YU2fa63KqrgzyQ0AvZPJvnI5ucOubG7F6Pmp2N6FvGGGNxkZF2gpk/JfPrV3ukvcqbe8M
	 82jgKYn8fO45qVxN5W7LUZLL/2g8+lRpwFrWRPgEJgtlcBMAy63O+0FdCBkqEBdPWJMkg
	 t1a9O28G98CHxjlYvG2upZ44bwRQNsZAp2xoRmz5OijCZkAPaRicK+C68ai9vfVGdwWpe
	 SaCeloOJ8ab62Ui1AAVE8QnzTLVgtYtVdmubRj15wAqNuNmvYAsCyDCz75nQp/XOKRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794927342;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=VKadNleMHJBLRP4szDxTc4A4+nJ0/Pl3hG9PQuxpOUk=;
	b=AvjxLWDy3tQ64z9iIiLY2SbbPusYdGUKPOOuAln0zgopWZpPevmHf3KXrvbRXvjYW5lU
	 fD4vjM0J+du66mmVsYufmL0yqPygHjga3g7ofjvQh0CkEgWMcxgShdPaV+SzahIfd+F1w
	 jV/jX/HFID3/i15LDjk6b6noBEJO7CJ1qFRpxzKZVFgiLYFNg2wHDBb04Ug2vpXNEpYL2
	 g0r9762AbYHFa6YM2jxyHWkmc/Bu2FYfdbZ+ywKTLCPbvt5y3UNR/igl1ZmmrlFus4UkB
	 qLmbNpDhxT4eV+FE/GbA1iPTlJTLva8PCYlcJaxA5Fkm0/Hv9retDlrZz6KwN2gd7Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stani.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=T5T1Vgai;
	arc=none smtp.remote-ip=209.85.222.200
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFDC606A338
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 14:55:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBFDC606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stani.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=T5T1Vgai
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934963b2bc0so918250185a.3
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 06:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794927341; x=1795532141; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VKadNleMHJBLRP4szDxTc4A4+nJ0/Pl3hG9PQuxpOUk=;
        b=T5T1VgaivdD0YfEnxADGj0sSnbChlsGKMyvYd28XOnFm2t/W6zWqHt6GffAlu+DdF8
         9eDYRC3Wt2sm7L2qAINRIEkFhbAyflBH+lCkkF5xc8jymU5GE+BKQZ+DLor+sZHS0qIM
         RpLVImvu04e9tBQWX+OZMWU7W3/818RoDPRZPJm3cIDJ6Jh3p1oyCrK/lnA1ssVbdlLw
         jlJEf3smedj7UfplYFzd7fmwR4Q3qG3jCs0bQvTKvdkbYyTChKNV31tcBFQWnYC4H1vn
         VihiHM74lldIWjSilWsBapO46SfrwOBzTdLw5EDXcouw8BWcdTUl5SBXmkZ7gOvESryi
         P9kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794927341; x=1795532141;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VKadNleMHJBLRP4szDxTc4A4+nJ0/Pl3hG9PQuxpOUk=;
        b=sa/4ylxYWpO8HMXXcbFtFTyNvhI7EvNzjVGi31P6BAS3NEx/hhnYZSxiVgK7sazHQ5
         MTrN2bjdzEGz5FBxuWYaX7mCNwDvealMWO0DTFE4CjacmXurCHVx9UYIBghtdM0B5dFA
         SzRFzt9vcxZGN9sTrsb46ps/kX88MfgoZSbGaFMwauVUfdNafY3OH4gSJuDiA7XX3UW0
         XF0LYJrAxYqNrDEu3gyc+NxkfYBzehkQpi2lXfRLVzNlewAEjRW5yoISUXtK5KoLbbUg
         Uo6ICMrkt0xVXR5eDNKXIYyToj1FYawJxzG7KjBmNFFofUcoTDknZKMzNeWPHOVLNU1k
         F7Kw==
X-Gm-Message-State: APuU4Z+fLdtHvL8897UxL6WquNrm2fVxDF2qo1KqeWtGCaaIgaTWUQdF
	Fzj0DYRoLWij0HlOApbPoCwJzgyjAHerwdHYRgdNkyrhSRjwjLGbMXaPnjBiMvY1sR2Kv0xHqpA
	lGw==
X-Received: from qknvm11.prod.google.com ([2002:a05:620a:718b:b0:93f:43a4:a480])
 (user=stani job=prod-delivery.src-stubby-dispatcher) by 2002:a05:620a:8908:b0:93f:47fa:b722
 with SMTP id af79cd13be357-9494bb858b5mr2039910785a.13.1794927340273; Tue, 17
 Nov 2026 06:55:40 -0800 (PST)
Date: Tue, 17 Nov 2026 14:55:08 +0000
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
Message-ID: <20261117145522.1910636-3-stani@google.com>
Subject: [PATCH iwl-next 02/15] idpf: wipe mailbox send buffers on release
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

The mailbox messages are freed with kfree() once they were sent, or when
they couldn't be sent. Some messages hold secrets, e.g. the PSP TX keys
inserted into the SADB of the device. Free all of them with
kfree_sensitive() instead: the mailbox isn't a fast path.

Signed-off-by: Stan Iliev <stani@google.com>
---
 drivers/net/ethernet/intel/idpf/idpf_virtchnl.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/intel/idpf/idpf_virtchnl.c b/drivers/net/ethernet/intel/idpf/idpf_virtchnl.c
index c06b2d9bfe0a..fedac4716b08 100644
--- a/drivers/net/ethernet/intel/idpf/idpf_virtchnl.c
+++ b/drivers/net/ethernet/intel/idpf/idpf_virtchnl.c
@@ -129,7 +129,7 @@ void idpf_recv_event_msg(struct libie_ctlq_ctx *ctx,
  */
 static void idpf_mb_clean(struct libie_ctlq_info *asq, bool deinit)
 {
-	libie_ctlq_xn_send_clean(asq, kfree, deinit);
+	libie_ctlq_xn_send_clean(asq, kfree_sensitive, deinit);
 }
 
 #if IS_ENABLED(CONFIG_PTP_1588_CLOCK)
@@ -218,7 +218,7 @@ int idpf_send_mb_msg(struct idpf_adapter *adapter,
 
 	if (err) {
 		if (!libie_cp_can_send_onstack(send_buf_size))
-			kfree(send_buf);
+			kfree_sensitive(send_buf);
 
 		return err;
 	}
@@ -230,7 +230,7 @@ int idpf_send_mb_msg(struct idpf_adapter *adapter,
 	xn_params->send_buf.iov_len = send_buf_size;
 	xn_params->xnm = adapter->xnm;
 	xn_params->ctlq = xn_params->ctlq ? xn_params->ctlq : adapter->asq;
-	xn_params->rel_tx_buf = kfree;
+	xn_params->rel_tx_buf = kfree_sensitive;
 	xn_params->timeout_ms = min_t(u64, xn_params->timeout_ms, timeout_ms);
 
 	idpf_mb_clean(xn_params->ctlq, false);
@@ -264,7 +264,7 @@ int idpf_send_mb_msg_kfree(struct idpf_adapter *adapter,
 	int err = idpf_send_mb_msg(adapter, xn_params, send_buf, send_buf_size);
 
 	if (libie_cp_can_send_onstack(send_buf_size))
-		kfree(send_buf);
+		kfree_sensitive(send_buf);
 
 	return err;
 }
-- 
2.56.0.679.gc527c65306-goog

