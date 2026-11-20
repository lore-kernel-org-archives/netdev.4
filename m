Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795203452;
	b=xkWz/Gw86yMJ0JN2Rqhw/cwHGBQOjfmnN5LrsCYLixaovJnhm6engW0CT2CTuNoz73yJ
	 BByHZYBn2R+dYHEHu7hFqIgWAM2TxfG+6yYoufjWKFCCBml7Rm/USzCP0sURm1/WM5+B8
	 2p9+Fp9GGMjJ763C8tIdL4YGeK+JQt2PRmrThaNoYvLB2QnMChKi/KXqheDQJv6zPWP26
	 G5gvxFn8BDQXtK3RJ78VvrFjaoWajvRJpwzGKc3KlFRo0XjQZynJO7bMNYUoChnau5iNJ
	 0fPjsaIq4r1DWKcnkZds39of9FJo/WJvTIPjAPStlrlzpIiFLFmNwtLVMvudGoDa72w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795203452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:From:To:Cc:Subject:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=HLU92PpOXK+Ktbjntwj6K/wKzrqD7ZTq4i89OR79Z88=;
	b=VqutmAXRglZaMeXHtbsIgViDWx8ToCb8qaNAoGv5tRPqLcHoNkVP6dxE49CS5k9r8qli
	 hXisViHMlaEqo8RHyEE0Pkt71G2ltFZNJjYEKbh8z8XkjB9pQ+Pe6eI+VnAdroxjg7IH3
	 zJhURrwvuaPgqXfGRhKCucqXZR7fQ4U9irF2vrQYKnL16vCSvuqshLOPU/QNqqBSQpPmy
	 woNaYre2ZFqFP3AWJBuX+2XIALDMegvJzOIUyNgQH46yAbw4EonFsWcizlcxYwQzpsYJY
	 w32QuoVj61WfhPORgwWaog42p5tc5XrjhfLBFolCpPmRKN4zfhO1+D0ZnqrUqxn9rkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ejUUxyfM;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E96D606A6CF
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 19:37:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E96D606A6CF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ejUUxyfM
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3adac5b29ebso788699a91.2
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 11:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795203451; x=1795808251; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HLU92PpOXK+Ktbjntwj6K/wKzrqD7ZTq4i89OR79Z88=;
        b=ejUUxyfMijObmR/uk71uc7wEiWG63666i4kANiVWLKS7e/TPrrDFRbh/lojYHlKQwM
         HNgjBk6ieOzaG6ss2SQE4W8DWwsk3WblsgjSaxY7Qp7+nfp9DTkAonaPZOp8sbG+q54y
         c5TDKfV+9GA/zeJBnGq8yYq5jZ33RdGlI/AJtHE9SD+ABUzjhinTq5mb8CvP767E2jOz
         LfvKnL2r3Xm3oE23U5QMjMHdqNNcpz5TOnNcNbSBqx9IS1ZJjS16NX8ZCGX6PC640YBt
         wH/V9z4epp7jQSKsNe+VwJpqiItaoWSEEIkjebRHiGz9eoJ65r7GO5uf9y1CWJ2PBXvZ
         L12w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795203451; x=1795808251;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HLU92PpOXK+Ktbjntwj6K/wKzrqD7ZTq4i89OR79Z88=;
        b=jD8U3v6Pc2Lr/cI6VFtdki69jRRig9qqyAeScxMJfm5Y3gCMNFPL0UwarXIPkQOiDE
         ZHa5IWE9KI6MLVE4urSAerBguZi79pmsZUsuY9UloZlMV3VIlkHFT8w6ZPqG6WSOhM6I
         Bui884lU6PRgv7ke9giWCaSgxNJGiHCFZCXBXx4zPY7V6hRh5RRiCqKD/Ze+uDqm1DLA
         QuufSo4oSnUJUIvin7GQCjPmLoeMv4HeK9yopk3Ewml8qfDCEVQqacMrab8rpXxN5gMh
         gG2iwj902FetBscx7IbOuIXH2clgOquC5BtxDG90lnzhinfdGVFdk/asoFzAz01mNzV6
         bo5g==
X-Forwarded-Encrypted: i=1; AL+hErFC1AVRTwcmXaJZRCyGqm1npNsyCUIraxILgybqxRosT6TNDQGf32IY+U3EF/aASu6nMqvYGCw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/J8bY3sIQnjtu01PlS6wwC9K+5u5bDmz7zTOk4ZNx+/Cr6cFWN
	QZX55bqNLHUPBlnNuQLeHBq53llg4IbFeSRICf+WFn6gUAcaOpe3vvP5
X-Gm-Gg: AZFdTZfGOIfYQzv5z/A4/156UOUCY3/+NXFC9ayfe2y3rN7ZzO9cGfLTR1luShtHM5R
	FwShJzZlqfKbsOeVwLh7QuV6ZdYOudscingksVAVnKHrjtJdGIiYygxivqpMf/1P3guniT9rpHI
	VxaWSp8OZrWo0C7OYkds38XQRnBeuJoMNRRTBi8voai925KpIgLFmURc/YrVTn++CExCgyqUKWQ
	q7lRcIA7uXT6tffP71nmtl4kFc6NEc23G+TTSct9esdKdgH6cDCfHYcIsa5ul81GXB/eQeeA92y
	OaUT5r6X4zF7kKbtGJTuhCCpLNjDxx9IgwoBO/Q4Oxbf6zmRww0J8SLYKWfEjLa4eWjlnsbwyPD
	CVgbXLFolx9IxK1UMuJeCecbCZBQILwTP6ueagnZd6Ezf1f5GX5H9frnvSex3BsoFIEoxWqsWHO
	TXxwrESbbFwkNWRfy4ZewVYu0X3o7PlZtFRzHKlwV2IwDJ4hku9CYHVhYBPqNFMfGrUnOMpRvqb
	/4OF83Yt7fMGp8AMHqxwYPlrpHjrv7PUIKunBf3QMP4kqwvnRpB7XDjDtvHpzdxeswLdy4u6H7Z
	hGXOw7SDXnjvZ31QyMLRyDXZ3ZaIDBbZzuvKS9oNNsTqrX4N3+Ys33LO9HafEJOXxqMO2UYoYQq
	Nx0pNZsXDJ5YQ+jCK6/3O1nOL4bfTnVoEgQ==
X-Received: by 2002:a17:90b:4d10:b0:3ac:9669:846b with SMTP id 98e67ed59e1d1-3b41c852826mr3992020a91.9.1795203450819;
        Fri, 20 Nov 2026 11:37:30 -0800 (PST)
Received: from localhost ([153.61.198.243])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecb486sm8290165a91.16.2026.11.20.11.37.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 11:37:30 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Nov 2026 19:37:29 +0000
Message-Id: <DN0AIFQ82CFP.34SDTH6ZFZC1G@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Xu Kuohai" <xukuohai@huaweicloud.com>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <io-uring@vger.kernel.org>,
 <netdev@vger.kernel.org>
Cc: "Kees Cook" <kees@kernel.org>, "Andy Lutomirski" <luto@amacapital.net>,
 "Will Drewry" <wad@chromium.org>, "Daniel Borkmann" <daniel@iogearbox.net>,
 "Stanislav Fomichev" <sdf@fomichev.me>, "David S . Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Jens
 Axboe" <axboe@kernel.dk>
Subject: Re: [RFC PATCH 0/3] Introduce a classic BPF filter cache for
 seccomp
In-Reply-To: <cover.1795139109.git.xukuohai@huaweicloud.com>
References: <cover.1795139109.git.xukuohai@huaweicloud.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Thu, Nov 19, 2026 at 10:48 PM Xu Kuohai <xukuohai@huaweicloud.com> wrote:
> The kernel repeatedly translates and JIT-compiles these same cBPF
> programs, wasting CPU cycles and slowing down bulk startup of
> identically sandboxed workloads. cBPF lacks dynamic instruction patching

There is no VM startup number in the series
which makes me question the whole thing.

> features like tail calls or tracing. Its JITed instructions remain
> immutable at runtime. This makes it possible to share the same cBPF
> filter between different processes.

Immutable is not enough. The image depends on the caps of the task
that loads the filter.
Also any task can time seccomp() and learn that somebody has this filter.
seccomp_get_filter() needs CAP_SYS_ADMIN for that today.

fork() shares the filter already, see copy_seccomp().
A launcher can install the common filter once and fork the VMs.

I don't think we need this.

pw-bot: cr
