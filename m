Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795043032;
	b=VhPufAoXhxmtCik96muIVBQxl8l3nEjkzgWso5Z6/F5VPV7OV9ezoRHbHKhJQ1rnD2el
	 o0K8PXTgl+lWt1xk6BDfRVcg48vxP/V5haEFADJSDyf/6Z2KLPAH33yhqfkQH1do8g7cG
	 8BXQJyQEPNiekAOqxq1X2hzBjMdX0eb0iX9Fy+yZH37FVI72eZ5S8XmJjBCFjjo5RtGGq
	 iWcJ/c+YQ7L2rZea38hZTTatNi1TVU6OWfJPwTDmRiEpgYOYb7o3T2GG3kFIg4ouKajIY
	 GisWSigrwplv8huWJ02AhmF2Zuk0RE2NVwgWnkmukOMbN2eAqc9Ltu/c+MQVN5aEa2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795043032;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EDQ/Bv0EKc6YV/NWFzsUR1sguRZd0XohMFdCN/XmTyg=;
	b=SmZRJhS3FzOCBSw/5UMWqe177HBACyaDY4EDxuI4qYbYvDpyfsZDoli4ZoVKjlg0DKQG
	 igKfhQx9dfU/+Y97Cf1nokdCDUrTUm5EyTnwFFo3Q0fYAdA0jxigWri62IpCSJH0seb43
	 sEr0gMrLRPdTyJKdrLtxiWSyxB0FFVl70NGmzrLB/kQofNGAkGgbp5fdv4aegRVf+LjVq
	 +x7DtnCXzcO3u7tXHwP0tHR3M4UnVS0RPPnrlByoVrmdZCGTA92wqA3an3PYP1qY9pMRL
	 DEYDoOKH++JaKrPFOa0E6aMrSdHdZO/b6Wyrx6gavGZHhUhMqlru9mFBWD/ByrwyOng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=RQbWaqGC;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=dgZrJwWE;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7E160A2631;
	Wed, 18 Nov 2026 23:03:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA7E160A2631
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=RQbWaqGC;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=dgZrJwWE
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795043030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EDQ/Bv0EKc6YV/NWFzsUR1sguRZd0XohMFdCN/XmTyg=;
	b=RQbWaqGCv7kOzV30jMMyAx9/Xjq5hrVXuOiW5QsmAf58nqahidDGCVHMVM2mVxZhVziECc
	nmPQpKM+fmyik0hlcqc3Ak9T529zn7uWvireTX78uoN2/9/rTVt2db25gwxGyN+k9Za9Ly
	CoTotsivPkQdzDJUV6Ox0z7VahNOGNZMLpSktyzd7kotQdbu9+vY6t//kiQkqJQO9dCFO+
	0HFs56vRFXgdvrA+8IHgnrt1hBrBVX/AinR/ZF9qcVrTEMO0qf9VD284ag3OxkdAyvU+1/
	QaneiKcZRmTKCxUnlSQ5qmPMVpuuVfearkieRpT6MvMw/vpprdGQv7rCMoaA6A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795043030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EDQ/Bv0EKc6YV/NWFzsUR1sguRZd0XohMFdCN/XmTyg=;
	b=dgZrJwWEHiC7Kfu/38trUrGUjbpNDHf4fjPVlb9zV8C8S9b2W1RDoDHffPs3rVnz9OfZPS
	12IZOTqOi8FYSgBg==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Breno Leitao <leitao@debian.org>,
	printk@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gustavo Luiz Duarte <gustavold@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org
Subject: [PATCH printk v3 7/7] netconsole: Perform unsafe flushing on panic and emergency restart
Date: Thu, 19 Nov 2026 00:09:43 +0106
Message-ID: <20261118230345.808560-8-john.ogness@linutronix.de>
In-Reply-To: <20261118230345.808560-1-john.ogness@linutronix.de>
References: <20261118230345.808560-1-john.ogness@linutronix.de>
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

As a legacy console the netconsole would perform unsafe flushing
during panic and emergency restart. With commit 7eab73b18630
("netconsole: convert to NBCON console infrastructure") the netconsole
is now an NBCON console, however it uses the CON_NBCON_ATOMIC_UNSAFE
flag and this prevents unsafe flushing except for at the very end of
panic().

Enable default unsafe flushing policies to allow the netconsole to
perform unsafe flushing during panic and emergency restart.

Signed-off-by: John Ogness <john.ogness@linutronix.de>
---
 drivers/net/netconsole.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/netconsole.c b/drivers/net/netconsole.c
index 267254f046de9..3300b2bbbd413 100644
--- a/drivers/net/netconsole.c
+++ b/drivers/net/netconsole.c
@@ -2695,6 +2695,7 @@ static void free_param_target(struct netconsole_target *nt)
 static struct console netconsole_ext = {
 	.name = "netcon_ext",
 	.flags = CON_ENABLED | CON_EXTENDED | CON_NBCON | CON_NBCON_ATOMIC_UNSAFE,
+	.allow_unsafe_policy = NBCON_PANIC_RESTART_FLUSH | NBCON_EMERGENCY_RESTART_FLUSH,
 	.write_thread = netconsole_write_ext,
 	.write_atomic = netconsole_write_ext,
 	.device_lock = netconsole_device_lock,
@@ -2704,6 +2705,7 @@ static struct console netconsole_ext = {
 static struct console netconsole = {
 	.name = "netcon",
 	.flags = CON_ENABLED | CON_NBCON | CON_NBCON_ATOMIC_UNSAFE,
+	.allow_unsafe_policy = NBCON_PANIC_RESTART_FLUSH | NBCON_EMERGENCY_RESTART_FLUSH,
 	.write_thread = netconsole_write_basic,
 	.write_atomic = netconsole_write_basic,
 	.device_lock = netconsole_device_lock,
-- 
2.47.3

