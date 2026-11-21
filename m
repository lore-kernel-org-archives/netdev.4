Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795295004;
	b=V8Q8r1rJBXRfR4utiBYNWBMQkAOAkwhjCEyGOGtQW6XdiVN9DcHFSrPQknRCNxcBwdZ4
	 2V03PwEkq28FjWoPUrGOTEotD1Z8T12Tr2eNaxQ0toEpeWGUJExUGBIjAnwPQ0gps3goM
	 hd5e6vZn/ia616QYy19tc7ExLvWQU42bEvymjFejDATr3rs5nM8LMfri9nmlvchE/P2f9
	 ApbjJxzQUCiFwHp2pebYx6NophZVQqNlO9uvX1dfX7AGFYE5e0VYmOo5RjB38hlmpfJCp
	 YZREqG0t5kAXbSuF4/X8RVVfJeXaa2IyG5E5m3yQBAP0TQ+roTORS0GVs/yeaUgF20g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795295004;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=SPlLqVqf55Y88rFTBQbsnjkt3YvDdOHxCqnBg8Kp/Lo=;
	b=ogNMC1mVUnDTBnU6gA/lNGMOALfDznJflB0NhPqIsIU1svj/Y1gHYiXIyUGnAnfuPwZa
	 alA7tGMTB74f+pUK5r3WI0AwmCOLpfz+HfhFS3IgPjpNhFQgCk3SyveHCYWqyVQaretA6
	 QIrwD9Xww9yrs6Iff2ozquLqX1WCuo+zawNzD3oE5oaINniQ+hEKLzBs2vsgpY0tOmjX3
	 IfJLa2nIx4nwZG2LVQ4BUpRZeaKh5n+/BE9ZRYKJ9uvZWIziC1zrEhU1eP07nKYNWKx2G
	 j381uOu/zH/JHr65frxUf49YztkXFlUX1FHq34qliU2J7U9Y3kmwWOvsEWSNozpPHJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hS5ebp4u;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BCA606A320
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 21:03:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82BCA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hS5ebp4u
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2f04004edf1so14823555ad.3
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 13:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795295004; x=1795899804; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SPlLqVqf55Y88rFTBQbsnjkt3YvDdOHxCqnBg8Kp/Lo=;
        b=hS5ebp4uMa2AVYsi1vxNnTYqGVmvy+U3ox58p5T3/fsBRT+sujSYZWWSs/hcQMf7Zi
         vsQD3p1PpwnsXft2Uom9DsLeJ9wP75Ytx71OEtkxHtt9IHC5XR4OTkSrE6DiWIn1V0qu
         jTJ/3dNh/JylpMFAh2b0CBxOurtBPYK+XWKwmaCFSnQVswHwXl4bchom53fYr9A7zRHn
         m3oX2pLZNuaF/s6N2Sh78vBStW4NpFXbUnOMAy3vU+ocMFGcaG0Kt8LekfQJcah8VqvZ
         wxGh6yWeq3881kWGdkDI4ZxDdNK8A9o7xpy88ylnQqwl7DJnqaRhXPP2r/m0NH59R5G7
         OZIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795295004; x=1795899804;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SPlLqVqf55Y88rFTBQbsnjkt3YvDdOHxCqnBg8Kp/Lo=;
        b=xfAtYcZDZo7p7KIdWjbxSJ05FEENmAiSmt847oolAeGDB2xbsWmp4x4tt0XECtT9MS
         ObaKmziD90PVQOys2bKv5o/ByPyNYI0Zw5Z38iI9lN98Q8L1Rj7HwaLfUWYRRbL5FJkD
         irLQy30oqpRympRVZcJsd+F3ukVLPqGxYvJlrFx0UI72HSXeOOySjShJ3vBeZ2i8YLdj
         ljGxwGNU6A6y9Ij8hapYW4IJQnS1LRWyyynFS2JnJthIUkS8/YLvcv54jotNvJptbkpT
         jOuJAljnbE4z+op+DjPlDUJRMBJT1jtJU0eRvC59GW4q4n/QU8TuDC0dh/x5BrNMXyOm
         zmIg==
X-Forwarded-Encrypted: i=1; AL+hErG6KL6rVYQUPdKIbPrvMl/r6ekS5SGEKVTCltRtII/SnIxxvq82I9IvGnBk3eCgeelRLc8qbgU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EvcrepvFacdnAMzA8hfob4Dx22yXEZPVpig0g9zfJSOtyyzje
	yR2uHjvzqmBWihSc9h0udSYgXA9ZROrPbYl5xkTpxIedT/llH5ah+GpHKUlFPPHB0/r7njd2Wxa
	K4plhpg==
X-Received: from pluo15.prod.google.com ([2002:a17:903:4b0f:b0:2ef:d860:1c85])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:94b:b0:2e8:3d48:4d80
 with SMTP id d9443c01a7336-2f03f16ac83mr68060865ad.45.1795295003635; Sat, 21
 Nov 2026 13:03:23 -0800 (PST)
Date: Sat, 21 Nov 2026 21:03:23 +0000
In-Reply-To: <72918C6B4A6E0CC7+20261120040954.57832-2-guanwentao@uniontech.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <72918C6B4A6E0CC7+20261120040954.57832-2-guanwentao@uniontech.com>
Message-ID: <awIHB92bMoqKk-FA@google.com>
Subject: Re: [PATCH net-next v2] tcp: cancel cloned request timers without waiting
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Wentao Guan <guanwentao@uniontech.com>
Cc: edumazet@google.com, ncardwell@google.com, kuba@kernel.org, 
	netdev@vger.kernel.org, melotti@google.com
Content-Type: text/plain; charset="us-ascii"

On Fri, 20 Nov 2026 12:09:55 +0800, Wentao Guan wrote:
> When a cloned request is migrated again, its timer has the same lockdep
> class as the running request callback. Using timer_delete_sync() through
> __inet_csk_reqsk_queue_drop(..., false) can therefore trigger a
> recursive-locking splat and disable lockdep.
> 
> The clone is unhashed when inet_ehash_insert() fails, so
> reqsk_queue_unlink() is a no-op. Its timer is pinned to the current CPU,
> allowing it to be cancelled without waiting for its callback. Use
> timer_delete() and drop the timer reference directly instead of
> synchronously deleting it through the queue helper.
> 
> This change depends on the request lifetime changes in 
> commit 4e2b3ef19e0e ("inet: reject unhashed sockets during established lookups")
> Without them, __reqsk_free() frees nreq immediately and the pending
> timer can still trigger a UAF.
> 
> Signed-off-by: Wentao Guan <guanwentao@uniontech.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
