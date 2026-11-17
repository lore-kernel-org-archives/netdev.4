Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794911725;
	b=4Dm3lo3n0YaXVQLa8UF1y6SmISHW1tKq2OXt4i0XJnold+BH0l5+ElsQlxl8KFhuVg9W
	 kEz1O8FOrCEQz6tJupJXwdzSUP9kttvIcf8YL2BZ9dkKGEefn0/WBxUdQJg0n9eiHYN5D
	 B82e9JAOWIxaKlvr2Ft6jc5I+uhlIp8tOXLE3bHvoCTlfGygXxehpJ/aTGVy88xwBTB+O
	 7EHtkFMfxELSFocdOt/sBZywrVp7hG7y3+2e6msA5T690TSIKS0kxucehZpb6PdeSy3tY
	 a1wFLONRLg+Z6J3Uv4aVauyFs1/y0bLshWKzXsiCRM03Jt//VZv2zG0hW3zYNvipeQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794911725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RuyZ4/NgPAofSNXbBjGZkZZB9QA0/aMDca1cWrs9WFg=;
	b=DyR9vY1o13fW/0nqV4TCwHMjJ25i+z1era6pbMEe+KpxxzvZF2azTNfVcyzf34TlOwpo
	 0WhG53hNp2/+d6Dtei3DQzA/LNz4YwgVNedJvOdsWsCg1wCgoy2vhzTLppOy7u9LAdWN5
	 TNXKqoOgWM7hSqTQ55cE+iB2sd8RGfJnHCX01vWIuy3N1sdyHf0QjCOgPbMc+o7cLpRwM
	 hNuuFMAs6PExoK1twmFzZ5+rODPu3VyMgBYh0DFZ1PyBJHhWTEcCa0pDfcAD33T9BegIS
	 ox9uuG9+L19u7zB+RR8y6YL+MLniSMABn0FGDM37Fzw9Tu0J1VAgF80T+7JWtJz9CJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RvFXG8Wj;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC22606A893
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 10:35:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EC22606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RvFXG8Wj
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc751eddf25so3472296a12.3
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 02:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794911725; x=1795516525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RuyZ4/NgPAofSNXbBjGZkZZB9QA0/aMDca1cWrs9WFg=;
        b=RvFXG8WjjKnTMy0oENVxlESIdVeF6WKEdiNDXunqUUCkkvQvKrb1EXZV9xmGB08fS3
         GKBazE4QO+VsYoH2bZHPTRAvxGv4vB31iiEM/JNLZ+0ti7GUimE9nOHnUyWU5J+oxavn
         Usr7arx6vVCNPU0a0O/knm5dDC0CPAlKkRY+lI4/OwzgM+9n7B61/hvjrn9xMv/3vf41
         MaBmT7CMkPOuR1+8iWIJEUqhi1dzJ4sKDGGwtXG7WmbGSjsvwMs5u+yaDQ6lUdy31rP6
         SPBda7tpj6zYniwGPOHetVokVPwpScwCsEiYqFE0y6oRJCAuK3KxHcP9sXQUmXeWuTBZ
         3neg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794911725; x=1795516525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RuyZ4/NgPAofSNXbBjGZkZZB9QA0/aMDca1cWrs9WFg=;
        b=GvaKiZiThq9w8bqmUOOD0P4/yfHgziCZ8iyON8gd9KSGmPLuDoXuPNlwHhgKU5gjPF
         Uvht8tJgZtMt777FUjA3sC7XAcG8FTgPgjf4W0i7WzufEso0nR9jnDPCSC/RkQKgSM+7
         oNU/SMSQbc6Ca2y28PbCuGtDAp4HLY5vDvYW2WnXxgh7Ewb/aJkc6TYMwgtyznbz51kK
         JWptWUNcr2Pf2Z3FzAMYlYY6nGC4AwWC3wTicxutos+fclR8isNp9DUb1yyWrSINIOk4
         EhvkVg4p7WPyh06yhN6oMgSEHMD9kFguMR/RwhNIqojKaKts7TQs5zA+lQNIRJ47uPDq
         A8ZQ==
X-Forwarded-Encrypted: i=1; AL+hErHqI4kncdpWW21WsQVnnBbbohGg29nLEz+77g8UNqcB9Hdz+pwbYyzE3PwPI0qIs2GY9fOKceA=@vger.kernel.org
X-Gm-Message-State: APuU4Z91A3T52z8yaIeeavRfkUmCWfGHEW0lx7yMeTLAqai54sx4xOe8
	yO5TMAAjx5QyGxPdIMHwj1PgrUTP35+eAEjlts0ypqkI0kEBnz75u/yF
X-Gm-Gg: AZFdTZfCJSHUZZtTLmk/t4G27cQLunDq2/fmP+/4mife63qVqtVoznIU8aKkXD4hzSG
	G/DUU7djMZNN3c3dExt9MHMIjvnUIp3BNRHh+wEbpKwbpKMx6w2NmzHDTT8eMqq3NOtHqmlxCAr
	01VHmp0UBPIwL7nspgIhno5ByQMcoQZoRDr4FN+XJVVoSQCIBkhz3ySDwW20t2BTiClytpkfe1n
	gjwKDJDsFx4HwR+9mTJZ9Ld/Y6c2D5r/2c32pURzTMIDEXRLintyGYej+m6nNQdSWc8xfjG4HJy
	lQm94LNPpj9Vq+0yFP9uqwS1XzRSH51DstSzh5IeknfBgGt4dRaZ+c6KoIU4KmtUl9fY26u8BFb
	x9+I+mmOacRFcV+MK3iV/zSjNkG/UW9KTK0NzbkTkcafZU4HyE6njP9qcAkprkxAuBW9QrakCbk
	QqDHXbeXL51K9mnKxqIjNDEJhgIqcv6x0izBhA3Ttxi4rXI1AE7ln5UtBJ9E4ewgaq+lwCSZEZ8
	caQ5NVGtH8WqgQ65O+FW1edjM4yweDJpgg1I8xuhOQmgg/3INoJ4EIHCKP8wZn9b5b+r3BpZjx6
	x6ugFWbYYWWKVMaYxBzLrbMCzdmGSiusO1ql3qopve+e
X-Received: by 2002:a17:90b:1f86:b0:3ac:7556:8ee0 with SMTP id 98e67ed59e1d1-3b1b0b666c5mr13803607a91.19.1794911724811;
        Tue, 17 Nov 2026 02:35:24 -0800 (PST)
Received: from gmail.com ([116.162.234.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abeaf532sm3518806a91.14.2026.11.17.02.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:35:24 -0800 (PST)
From: Xue Boyang <fuchen.dust@gmail.com>
To: Robin van der Gracht <robin@protonic.nl>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Oliver Hartkopp <socketcan@hartkopp.net>,
	kernel@pengutronix.de,
	linux-can@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH net] can: j1939: fix null-ptr-deref in j1939_session_completed()
Date: Tue, 17 Nov 2026 04:35:15 -0600
Message-ID: <20261117103516.535910-1-fuchen.dust@gmail.com>
X-Mailer: git-send-email 2.53.0
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

j1939_session_completed() looks up the receive skb using the session's
current data packet offset and passes the result to j1939_sk_recv()
without checking it. If no queued skb covers that offset, the lookup
returns NULL and receive-side processing can dereference it.

An inconsistent ETP session offset can leave the receive buffer lookup
unsatisfied when the session completes. The DPO receive path does not
validate the offset against the receive buffer, so completion cannot
assume that the lookup always succeeds.

Check the returned skb before distributing the message and releasing
the lookup reference. Keep session deactivation and activation of the
next queued session unconditional, so a missing receive buffer does
not leave the completed session active. This also matches the NULL
handling already used by j1939_simple_txnext().

AI assistance was used to analyze the bug and prepare this patch.

Fixes: 9d71dd0c7009 ("can: add support of SAE J1939 protocol")
Cc: stable@vger.kernel.org
Signed-off-by: Xue Boyang <fuchen.dust@gmail.com>
---

Notes (j1939-null-submit):
    Based on mainline commit 666539eecdf4db623f5e3c3e55cf9f2dfad24aa4.
    The affected transport.c and socket.c are unchanged from the original
    local report baseline daf677c2c6449011ee695d55b48b5b2977a36f88.
    
    Validation:
    - Built net/can/j1939/ with W=1 on x86_64, CONFIG_CAN_J1939=m,
      CONFIG_KASAN=y and CONFIG_WERROR=y; no build warnings or errors.
    - A temporary userspace harness executed the extracted completion
      function with stubbed dependencies. It checked missing-buffer receive,
      normal receive reference balancing, and transmit completion. The old
      function passed NULL to the delivery stub; the patched function did
      not, while retaining the completion-helper call.
    - This revision has not been boot-tested or run against a CAN interface.
      The harness is not an end-to-end kernel regression test.
    
    AI assistance (OpenAI coding assistant) was used for source analysis,
    commit-message preparation, and build and isolated-function checks.
    No packet-level reproducer or triggering sequence is included.

 net/can/j1939/transport.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/net/can/j1939/transport.c b/net/can/j1939/transport.c
index 8fcfd13e5e6f8..ecf7f245f8378 100644
--- a/net/can/j1939/transport.c
+++ b/net/can/j1939/transport.c
@@ -1244,8 +1244,10 @@ static void j1939_session_completed(struct j1939_session *session)
 	if (!session->transmission) {
 		se_skb = j1939_session_skb_get(session);
 		/* distribute among j1939 receivers */
-		j1939_sk_recv(session->priv, se_skb);
-		consume_skb(se_skb);
+		if (se_skb) {
+			j1939_sk_recv(session->priv, se_skb);
+			consume_skb(se_skb);
+		}
 	}
 
 	j1939_session_deactivate_activate_next(session);

base-commit: 666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
