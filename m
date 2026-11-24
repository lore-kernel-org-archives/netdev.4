Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795490468;
	b=GaXMm2HhXlmtto1+qNVpSltr5DXDr4iZVp0pzPN3FRbK1tH9OGYW8Dh+6qanE1vHG1Ux
	 4Ft+ggmnNoJ49O1dDsW/RHsvjeczTDnxUvqAIhanlwb8kZaF7KwFK8dIoL29L7DTLO/bY
	 mxJhhrDICxFNPI8p86swcKHWDbFtdLttoJKWZ+bGZ2JpQuirzocR0NlMaW13F0FOogqyu
	 ku1oYUSkX3/djbp0CCWu3wBEFCwQXHbVT1R30+i9Lm71XYGzh03mLpL6X+nXgHmEYV5EC
	 nZsn53BvSoqjgs0eX2pc2fR3eOblQA7IWCx7IAPfkeBwbD6OhTsbr2AqdMXcheuPsiA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795490468;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:MIME-Version:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=ZWDg+cYEzmZ1vYvzbJGAnTzFCORxgLKMXanTjf9ODFg=;
	b=B68k7qcCuEymDqtCzL1zReAuWXRFIVVXn53vkg4uuqkrrCeZ2RTBcGZ/JkE0P/xoyqWD
	 IZ2t2xmPQiRG67B8WUb2NmaN7qySkegOkMPK1BHdmOfLeoa/RLcmNPTFtw+np6SoGinfU
	 gR12Uv1p0cmHNkESISLRgTaMXTQpUwSRoxpknOvUeyyPyPBaisw4LenVkz5WvPk2L7ynZ
	 vr2ZhvUwKMlHScKvl6qJTQg2NdcEm0Tmf/Eq4WEW5GWBoJEv8JYpokq4XLj44MXSppGTX
	 Nbasq9ky9dkMdJ/PLoQ38Y+gp8e+4qQDvGaGw50cyiz9eYwlEZcXwL/57eUGOcx+seA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZA4ozIKd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C979606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 03:21:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C979606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZA4ozIKd
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-677d35fd1d2so4039227d50.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 19:21:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795490467; cv=none;
        d=google.com; s=arc-20260327;
        b=du1MA2IpqyJt/8NnBI7cfItx28j7yvcbGme7I7iR3O3utJX0u4eYBUvgghLGg0rUZz
         x6mklxY7sw49NkFA8rxeHRlDq7BTuP1+7ZInCbi8u73Sdibw8/xWcE9hO0bxBDFsR1oU
         ok8nZ7dORR62FCvyD8oO6dWTVmLrR0xx8c9kZ7EUg/zv2yEW4cozUjEPVAAdfqhWiESQ
         N+j87RRwuAAVXaonqWJhW7NQnAs9oXtwe5D+eZ6k0FB/GX688AtKOK2w54iMxYecfiHI
         xdK1IiTJmNYPFq0fv7ajW4FP79lwe9yhySnVp7I7kS8gYyHqGDncRH1peerTxBDJrWox
         kuTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=ZWDg+cYEzmZ1vYvzbJGAnTzFCORxgLKMXanTjf9ODFg=;
        fh=CeSRxtqQLuAvMNkzUmYbcZpUM6ItZsCts3lHI+XZSx4=;
        b=bm9ZWubTbuKrS0HTW6G8omb17n0nLbacMhqMRWVGznb4yBSsjeGdoE5yL0Im9jKGlx
         8EfFIMEpo+v6IMskDQ2iuNzsaN+zN1/APFpps6naGEDrUT/u2A5udqwI7mafT4kco8OR
         dBvGNvDZbfkP0tNsXV5HslFq3I0H0yH8w0GXQSkpHWAdZWmEdG4Q3TePc4hAlHPqZZJx
         N0BsHaspXKdt/sg3ireqN5BNlGPEXRZLm/EWmmWAN5OQCTRQrlipbq2EwKIcngvHSs/o
         MkC5QVfcLk8U/5ofQTNftmdoWqXqJVT9uUJK/+DrdwQ0ZhOUr2O3c/7EoWs5kVgPAPNk
         WPHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795490467; x=1796095267; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZWDg+cYEzmZ1vYvzbJGAnTzFCORxgLKMXanTjf9ODFg=;
        b=ZA4ozIKdl81b1ff899siClY9b3FPWUK+FeslD9UvwKLAjcj3ZhON1AYyzagGeCHFnt
         82vZuTYRetYc5UdSeMtg20/XLuI74Kal1khr92UKfyMTnsqKq7hWmSNMKVJrm+g+Biel
         VjlzUV48TlPKI3/q7LWDDslWbXDJiVjPTr00k2tpdeDahIRxQcdf4bbkFI9rAwIu17KV
         jr80iJfN0LW9LqFMkYdxPJRMNylOmXAaaTpgOpnPHF9B4Ua6H1SymjsQw73LcGMdmkrp
         a85vYd+owM3tsi1JzmQaHeszwNwLSXQROcIxONXG87X31pGky31cVpgxrIWEFMfGOZRV
         Q+bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795490467; x=1796095267;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZWDg+cYEzmZ1vYvzbJGAnTzFCORxgLKMXanTjf9ODFg=;
        b=HmjIkzZg8csq0qK6DYYPTKSgQaz1/vNUOYnqOsLyfmEJoPESy6P+mzbQEe1ZH2rW9M
         VkSMjFx/VAinsB0UNwZV7RHWnyO8opOgI6cMI3QhKhGhY2VVBbo1UqwncxZgU1dJLlF6
         I/OGyvjLwb6GBMR+H/7gtWRXXBNSpmvxTbi0UGzejPPmkb/5JB02InqGBQdFLl84+/J9
         8RpQmm6pob/SRKBwCeZ6wq/oa+l3YkcOYjZzQs7oLy+/gcRTP2vF4rbVQQD74TZBtruV
         O5qpoKYF2L6kAWWR9Wp3Z9yEymI2IT0a17jKpLt91D9r1tnWJkqVEZgYr1MP02oT6fld
         OgQg==
X-Forwarded-Encrypted: i=1; AL+hErH2uf7XqqU4dYbHs6P9xUhMoNapGQpVFzw7aiqWAqxJDMLoMUd8xO4D5X+1EM/bh+pbRwSnDxo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8s3HlFD+FQb1TxRFeBJ/RVum8PqRHqmsKoIa//yRPgQmdllBiR
	wcMwKEW+h6gHZW+CwI/0KRdc78e09JKy4/J+hSeQcucn6sUhlYEBGImKZYmI6w1BSxpCN4QxI8n
	0EzE8ZaSurZLafXOLBbIC1SuVeSs/FrA=
X-Gm-Gg: AZFdTZd5C/L4ADa0ANrwvvlRSyFixytn3uf5Lc1BheY/mI++AbjXb2ui4DrEiQwimhJ
	u1MpvgOn3uaaZxH2ly7d0eNhMps+wkKCp+KllgDFR8ImGgbKqIYckdVhKx7qXOijfgbPdu8yr3l
	Tr0idHHewJo1uH6Ra3u5+iRf6VdhzFJnGDkWaGmu94MJhhv9ATEsIqlbSAvcrokwqUm7qooMOPk
	v2mZG93MPyu33D99SouqIRXdC6vXaDGws33bSCaUWJotW3pSr4rF7D7ZqxGyfBrzdHZ9Ah1AVG/
	6HQXhShRo7MKrCq3LJ5IcslTXe/GADWfg33J9kmGdBmeJTH+JAi8KrADRojd7nr0/HxrpBDWeox
	QCwc35mcJtGah6ujD5rL1JEDFaojeJJEINh0REL8UDVr53Rbw7lwv4L5sSA==
X-Received: by 2002:a05:690e:1905:b0:67b:e67a:da38 with SMTP id
 956f58d0204a3-67df4423620mr4510969d50.21.1795490467284; Mon, 23 Nov 2026
 19:21:07 -0800 (PST)
Received: from 723974502065 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 23 Nov 2026 19:21:06 -0800
From: Qican Ma <goonsomeway@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Mon, 23 Nov 2026 19:21:06 -0800
X-Gm-Features: Aa3M54oi5W3hts7IvD6RqrKWmrg1C4_Je8YHGmDB5ytcVLRAJrf4yW87opup_rg
Message-ID: <CA+OT+OPkNsk2QHczVmb6KVJ+z_1tpH9DXm8JmACc5E6x-YFwPA@mail.gmail.com>
Subject: [PATCH net] net/smc: serialize clcsock release against CDC receive path
To: alibuda@linux.alibaba.com, dust.li@linux.alibaba.com, 
	sidraya@linux.ibm.com, mjambigi@linux.ibm.com
Cc: tonylu@linux.alibaba.com, guwen@linux.alibaba.com, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	linux-rdma@vger.kernel.org, linux-s390@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In smc_cdc_msg_recv_action(), receiving a close or senddone flag writes
RCV_SHUTDOWN to smc->clcsock->sk->sk_shutdown while holding only
bh_lock_sock(&smc->sk). Meanwhile __smc_release() drops the socket lock
and calls smc_clcsock_release() (which clears smc->clcsock and calls
sock_release() under clcsock_release_lock) before calling
smc_conn_free(&smc->conn). Even on paths that call smc_conn_free() first,
an in-flight SMC-R softirq that already looked up the connection in
smc_cdc_rx_handler() can still enter smc_cdc_msg_recv() concurrently with
smc_clcsock_release() and dereference or write through a freed clcsock.

Free the SMC connection before releasing clcsock in __smc_release(),
matching smc_close_active_abort() and smc_close_passive_work(). Because
smc_conn_free() sets conn->freed = 1 while lock_sock(sk) is held and
release_sock(sk) synchronizes on sk->sk_lock.slock before
smc_clcsock_release() runs, checking !smc->conn.freed under
bh_lock_sock(&smc->sk) in smc_cdc_msg_recv() guarantees that no CDC
handler accesses smc->clcsock once smc_clcsock_release() can start.

Found with an LLM-assisted code review tool and verified by inspection on
v7.4-rc4 (b6a9fa34ce4). Build-tested only; not runtime-tested due to lack
of an SMC-R/SMC-D setup.

Fixes: b38d732477e4 ("smc: socket closing and linkgroup cleanup")
Cc: stable@vger.kernel.org
Signed-off-by: Qican Ma <goonsomeway@gmail.com>
---
 net/smc/af_smc.c  | 4 ++--
 net/smc/smc_cdc.c | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/net/smc/af_smc.c b/net/smc/af_smc.c
index bfc0c7e71a1..1d8a602729c 100644
--- a/net/smc/af_smc.c
+++ b/net/smc/af_smc.c
@@ -313,13 +313,13 @@ static int __smc_release(struct smc_sock *smc)
 	sk->sk_prot->unhash(sk);

 	if (sk->sk_state == SMC_CLOSED) {
+		if (!smc->use_fallback)
+			smc_conn_free(&smc->conn);
 		if (smc->clcsock) {
 			release_sock(sk);
 			smc_clcsock_release(smc);
 			lock_sock(sk);
 		}
-		if (!smc->use_fallback)
-			smc_conn_free(&smc->conn);
 	}

 	return rc;
diff --git a/net/smc/smc_cdc.c b/net/smc/smc_cdc.c
index 32d6d03df32..499a2473b79 100644
--- a/net/smc/smc_cdc.c
+++ b/net/smc/smc_cdc.c
@@ -428,7 +428,8 @@ static void smc_cdc_msg_recv(struct smc_sock *smc,
struct smc_cdc_msg *cdc)
 {
 	sock_hold(&smc->sk);
 	bh_lock_sock(&smc->sk);
-	smc_cdc_msg_recv_action(smc, cdc);
+	if (!smc->conn.freed)
+		smc_cdc_msg_recv_action(smc, cdc);
 	bh_unlock_sock(&smc->sk);
 	sock_put(&smc->sk); /* no free sk in softirq-context */
 }
-- 
2.50.1 (Apple Git-155)
