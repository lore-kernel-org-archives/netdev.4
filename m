Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795567232;
	b=QH8cVe7BtMujEBKe0eOsTHQa71kQuVOCLYklye1NxmT1fjGDENaCYlPU97Kokm4MWqVh
	 msUcgd2AkW9QuPF+cwKoHfUkOHoiYsJ9jNA7vbZTrxfgueASx+Man6jnYlZCZI67PRsDY
	 eh2rxkb84KkQNge8M5J66nMXqfehgx1vKazxW+dp3TKv26sIYevlh3wJt7yYB1EJpUdkH
	 elrBzt7WQUwAw3gE7SYPF+qafRptyrAkIYKzLnoBug3oU/2UhgBfNMe9sm8OdQJF4xkS0
	 WFNxpPqhM9qMt45L+9/dAutqaHSkbgT9xrluokSL/dr/xZnGa9wP8qlwxG2uXftNuHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795567232;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=tK3CNGQ4I07DEstE6/SMS4SBHKbFdsxDhUVtrDt6klM=;
	b=PRNYxnIVj8DYnJMbN8pyaALKZnSPnlhO38lYU6E9D3oZZcpzA25xXhrk/bZ1VHuRjS5t
	 Gyj9ebKmxkB3mYQ5UeTI4Hmt6bQ+mAZDqbRVFeNu6ff8l1duVavq5d2wzjPooj9qXu6xU
	 9rzn536/Tvrgz+HD1r9Ru5p/ovkIR2V0EwiURfa8x2PEL42lq9i006NH5wwtOJiabTJhj
	 FXlr8lVvKbR1ipJS9hSKpq/br865/w2KUtnUi3derjw3kufbsNieIqjuQh45UBHuSVy9x
	 dCuAWR4hqQLYvl9G0qBtopQI/CWchcPiNVyoVEVSehunFWkWnJohtO64xT+jKpn6XSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="EOEa/Kz1";
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE62606A68B
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 00:40:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BE62606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EOEa/Kz1
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3854627c1c8so7348763eec.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 16:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795567231; x=1796172031; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tK3CNGQ4I07DEstE6/SMS4SBHKbFdsxDhUVtrDt6klM=;
        b=EOEa/Kz1GX2xjrGuCPhwAjQWknmZAf0aT7CCBs6NI8DHmNXTPlRQcifQpKThMzaGhL
         DHZbBLTiwLpEzoQbJ/Xmf4dli52hEbhjTHrxSgsfLYEfTz+eQUUeKfxT42dvZq3HiZbG
         1ow70GWmKn92A2U3NVbV2u+xzb4cFvgvSBCDtJ91/8wuWQFYEY3u+j0CFVj1RRPyBFAp
         s5QeqpYS+prHp0WzT+EKQtZ003gPLWDqdoQVV8to1nucktZjqITFuxZ41EGT7blPK0Q5
         WcfC3XP+CdWYuwM530Ntu9Vk3dM3XPKfMgHQpPNvRIZ568PaEsmKn0Wi6ZAk2Uqs86u6
         8tNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795567231; x=1796172031;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tK3CNGQ4I07DEstE6/SMS4SBHKbFdsxDhUVtrDt6klM=;
        b=fCuzVSMRvASu5ma5uIgv3L+VfyiEoBSKTcP+2TrBPdXrcZjZ5arykLRNLxYZIhys3R
         9lVMUvKOm8D8udfcdWxsu4IYatD3n0TwzwdgokD6OknbHA7EEp2giU+/gcAhf5oT5jsI
         +jCysheDDIf9IH99eX9uAge4UApqj00dePzGU9dWNsJFmduojyDNOcuvWN0fStWOyjJ4
         O1GmuUv8ccVPx5w6S7/wVmejdy2RwrWU22pEDrtLmmYv1C60XjCTqviT3KpqEj3xzsg7
         Pl+upHmQTHIOn1Yi9Rv+IZGCwnEw+FbLmiv74zE+aDERExvQKzZSt+wIi/wr3G11RqJb
         TB4Q==
X-Forwarded-Encrypted: i=1; AL+hErHB3xu/oKtPCup7kcavZhyqBKVqQFpnBHgRyWLqsPCkOnh5wx0vOJUx91/rLVUtT8wIq/j/ax0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9iVuN1OY+a/6dZEiN9CBr1SacRv09PvoV2kUBsTydvmEeTcT9L
	gcvrL8e6VoRFYonCQgJF4kSQzOFAP781eU9wUf0IeNO8SOq24m9sASwh2H54DNKTn+UO2gDisWA
	bhFHkhW8IGA==
X-Received: from dldz13-n2.prod.google.com ([2002:a05:701b:418d:20b0:15d:6b8d:2adc])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:906:b0:1a4:c892:b14f
 with SMTP id a92af1059eb24-1b556904c50mr21237934c88.29.1795567230804; Tue, 24
 Nov 2026 16:40:30 -0800 (PST)
Date: Tue, 24 Nov 2026 16:40:29 -0800
In-Reply-To: <179545553181.3135.4354699424439095142@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261119170550.1517634-1-irogers@google.com> <179545553181.3135.4354699424439095142@kernel.org>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125004029.1004901-1-irogers@google.com>
Subject: Re: [PATCH net] octeontx2-af: Fix uninitialized variables and bounds
 in MCS alloc handlers
From: Ian Rogers <irogers@google.com>
To: netdev-bot+sashiko@kernel.org
Cc: sgoutham@marvell.com, rkannoth@marvell.com, gakula@marvell.com, 
	sbhatta@marvell.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	elkin@google.com, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 23, 2026 at 9:38 AM <netdev-bot+sashiko@kernel.org> wrote:
>
> [Severity: Low]
> Can the response array overflow described here actually happen today?
[...]
> [Severity: Medium]
> Does the requester actually see these rejections as errors?
>
> This default case and the new rsrc_cnt > ARRAY_SIZE() checks both jump to
> the exit label, which always returns 0:

Good catch on both counts - 'exit:' in rvu_mbox_handler_mcs_alloc_resources()
returns 0 (leaving hdr.rc == 0), and rvu_alloc_rsrc() already bounds
allocated IDs to rsrc->max <= 128 before writing into rsp->*_ids[].

I'll send a v2 that unlocks rvu->rsrc_lock and returns -EINVAL directly
for unrecognized rsrc_type (and rule_type) and drops the unnecessary
ARRAY_SIZE() checks so partial allocations are unchanged.

Thanks,
Ian

pw-bot: cr
