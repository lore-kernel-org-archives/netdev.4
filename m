Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795069387;
	b=jgis0E57FMmhQ9RL1l13nqybGfQkIuVn6ApkIb+ejoYojBfPqHJty7i4ylcVBCpHngq8
	 qnTTJKpdjmhPStK0hmRmlC9ne/bT960JN9IzIUpYQwPLcCSUbZeTA47Ij0z5IMrrQlsWg
	 be7G+QDKezu7KhvVbBdmlSu+YGe+e57E/tdLZ6BHz3pSwijgKMN6aZP2x9p5whrO8MFUZ
	 6WkMVu17awhl8FsijAUZ3pq0Guupy4NDYyyVwGuX+TMfVpsf5UpBZOxPMonoLcVPOPREF
	 95bcCNLPw0xm6P/cAgIf16HBrdC1QQoBh8Wz7ZgQlKeDIp1x9+d/22KB7AjtSddJdaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795069387;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=V3V+gW+4QnpXlZqmDyQKdC1vPF8DCpUTnjwDnqaNguw=;
	b=zZ6h4Zjfoq3rGndBM3zO0PAPavegdwJiqvr0/Y034D7fneYR5gcvpbpSNLqcGnNhFyIg
	 CdWsjr0hfmUKbZ7TV2w+PebxlO+NUPSsqFVyggFPRHMQSiuwWLh5mzH8ft5tUIVROLqgz
	 e2HYj5lVJsVRZSuEvcwrOyb4sESjrAlVnbydF1QPRwMw7f9WxhJxdMfP5z9DoTJVqasTt
	 9XxEGJbYQw/nCuK7cq8xFsTdOZKo/Bq5PygFuZ9nJ0OGTuyP36Mbu+ZJmXtgAjDjp3flD
	 YRCnvEyqP2nMYghGDykm7sAUFl2ELlwCFvwe+G5PM4vR5w1dLHF0qNzqfKO4CBCC/QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KOgBuV34;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39DCB606A320
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 06:23:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39DCB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KOgBuV34
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2efad644688so17053435ad.3
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 22:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795069386; x=1795674186; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V3V+gW+4QnpXlZqmDyQKdC1vPF8DCpUTnjwDnqaNguw=;
        b=KOgBuV34NzYfNY8Y7g70SamQjhVlLaZKeKfEStrlLEqNrkjEQMxs+mWIdztfPe2IuW
         ld2bTPY+ZMcX8gQxhvn/YUwDKaBBodHQNG27lxWcTw3Xp3cQRZeW5kKOtH5pWWqI5lRs
         td4jULqH+ziG/zKS7VwPoDi2kgyXbjx9DRxm4njhquRZnAWZUmh/Ih3KffQXWQyRT+Mm
         1rsg/R2Ej58t6Qrk4pSFNyypN71dg4Pfuci1g71q36JkoDt/v6o52jJeA4FJTij9QmW8
         a5s/bCeUqPkm4q1kxGmovmgSvFhNXKf2s9o6x8BTnK2qwSksvKwBboTij8xvZRvF60YT
         8WEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795069386; x=1795674186;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V3V+gW+4QnpXlZqmDyQKdC1vPF8DCpUTnjwDnqaNguw=;
        b=CyHKRKaGDOQapyo0m9f3BgZ8c7Sx4cybWz7DRQPcAVKwQWdukvAZWPlGMEBBFkE3qc
         D00C8/3PrOPgwSFrUV9SpqJnrGzS5DKWelSk1mnS2gC/C1HMx6Yb6If3W6qM/XOxf51T
         OLfXM99kskQXWVwPbWVbl1OO9oJwbnm1CVyd+7GKS8uD5niolngJuXvEfTwxLaeCf3mj
         VjX0gJ2BjnEUEZgLEf5jZPE1JE+OuIW05M2Ganzp1JqlOm/1X+n6hYyxfXtEjLV4PfCb
         4x/Ox3BNwRK/GItBS1kve/dh9nVUYemywCxICE5pR5GxMguEPe69pb0T/pWRk1tkvCu4
         R1AQ==
X-Forwarded-Encrypted: i=1; AL+hErHoQ/Ls0ydpDu9w4ru32ElZEr9Ngdi+l5hCWLEIPkVLwqy1ogMfVgadeoYtAPHBRUeGc4bfBHU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kyKT5Xc/f2uTvnTPm/6GWhwMhYZJ5FxIIY50UIP12q05IbT5+
	Ir4wc0PEyqSxsRti/mPamUBLCyDIu8mbIbsOlkOPUcJ8XFV3tjvc9LQaK4Y/wYloMBRK6Dy10J1
	Ovej0dA==
X-Received: from plgi10.prod.google.com ([2002:a17:902:cf0a:b0:2e8:f377:a4d4])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:19e3:b0:2ef:ced7:9ff4
 with SMTP id d9443c01a7336-2eff740c243mr51107455ad.31.1795069369890; Wed, 18
 Nov 2026 22:22:49 -0800 (PST)
Date: Thu, 19 Nov 2026 06:22:49 +0000
In-Reply-To: <0907415D86226AEA+20261119025619.3485277-2-guanwentao@uniontech.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <0907415D86226AEA+20261119025619.3485277-2-guanwentao@uniontech.com>
Message-ID: <av6VHCsEnrAMOx0M@google.com>
Subject: Re: [PATCH net] tcp: cancel cloned request timers without waiting
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Wentao Guan <guanwentao@uniontech.com>
Cc: edumazet@google.com, ncardwell@google.com, kuba@kernel.org, 
	netdev@vger.kernel.org, melotti@google.com, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, 19 Nov 2026 10:56:20 +0800, Wentao Guan wrote:
> When a cloned request is migrated again, its timer has the same lockdep
> class as the running request callback. Using timer_delete_sync() through
> __inet_csk_reqsk_queue_drop(..., false) can therefore trigger a
> recursive-locking splat and disable lockdep.

This is net-next material.


> 
> The clone is unhashed when inet_ehash_insert() fails, so
> reqsk_queue_unlink() is a no-op. Its timer is pinned to the current CPU,
> allowing it to be cancelled without waiting for its callback. Use
> timer_delete() and drop the timer reference directly instead of
> synchronously deleting it through the queue helper.

This change depnds on 4e2b3ef19e0e, without that, __reqsk_free()
frees reqsk immediately and timer triggers UAF.

So please mention the commit.


> 
> Fixes: 97c8a3c1f73d ("tcp: Fix potential UAF in reqsk_timer_handler().")
> Cc: stable@vger.kernel.org

Please drop two tags above.

---
pw-bot: cr
