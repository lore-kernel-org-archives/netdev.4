Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795286354;
	b=dax3LXruA3FKcptryQnTavP22v0betpnBp/CC9PCYn4qQ0n1wNNl2GDRqeYHUQVxkoH8
	 2lMi/jGJ5XnpHT88+knQaS+Savd8o9w5MEaatPpyx1PX+yyUEO+L/hQ/663y1SJxb6xMr
	 khDecK/LG1f1kPBUcvV8xi8Ohi92O1qocgcT6sS6QRhXmuXLgKc7rNIf1Lw1G5HXHqu+n
	 67DD7FNKL3/whtCe7YcW9mAbzwBE5d80xiqGmnQeuRsivpT7Xc7hGFYt4YxutpCMVKLcx
	 Vl8Cr8AO4+2aJ39gRyPGUAnDoNXniwicUv5bwxo3XYekqUXfgRj/dd+CfOnIkqTDxjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795286354;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=B+C2/33K4kduexdkENaQSrBZ5xc/12xNlj0pd3fSUlo=;
	b=2mVnn1JV4a1Uhjv+/t42/Uu0sFsW8R0a3FhDrL3OGPdrkF/CmabvYfBGDj2pep6+aZHJ
	 G0tKzPwCloXqe9Vg0MGi1cIZ2sWCsmC27pVaU9RyeRt6hhjFic/gNSf1nyTd+dNokCSsf
	 +uJgLeB/3nO1SDE2lXFvWRzMN04hQFKYmIBK8+9r/ify/A8hxEF8ze/VTxvgKiNfNdus1
	 QDmnecBvKBGp8WJkQGxSnYsSr7trcXReFsIjWhewB0VxVMhs0W07Za+2GfnSBVe7bjPkT
	 BmdAfjXDnaocTUYG83R0X+ue4T1j0ZL2UWcEQOTWwXNkD9mmZEYYTnQ84hTuy3vObug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=N4LRxPnN;
	arc=none smtp.remote-ip=209.85.210.197
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39873606A32C
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 18:39:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39873606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=N4LRxPnN
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a0592d4539so2513876b3a.3
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 10:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795286353; x=1795891153; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B+C2/33K4kduexdkENaQSrBZ5xc/12xNlj0pd3fSUlo=;
        b=N4LRxPnNO1YjitxvDLP5/5kIqInUyAb2PxwB47pUzyklLYXgDRLm+hBGOagI9wIIHu
         zqGxOyfeJMlgyeICmsIL5liJN+MwmXywg7S1NQL94dcQresjALSGWYMSxAB+agNmQic+
         CIG5lRe9aZBEsF6MZKhIi22V+Bd78oiJBpcwsVJLmRbfv1ulzKuLuen4EPSlL9XpZz8E
         aw9FldXk7Su1f172F9G+Lz6zw4K7JFXDMOpv6euElqN69npigs8dtlapsNhkItca4PtU
         Yot9+fi3GxfeKm6XTWv4sK6rrRHpHhcvMEEa8na6M8UbGqns0ypFEnf30gskc6/yTBxG
         IqUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795286353; x=1795891153;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B+C2/33K4kduexdkENaQSrBZ5xc/12xNlj0pd3fSUlo=;
        b=RU8uGxHjYzAEYCwfVPhDVMhQpEpdeYmyu4mX2vBJTYSmlJqNl6N7ZtN4bUxQZ2481x
         gYCc2QYapiblrrmQWzFzBGQBzHWbageRPWFBwS6MCvTFVOKgEHrKMgHg4u/bgi+ajfAe
         4aDm2k63NbTwblRGL+veZrw+q//Z3WataV0JFwGbNHJgDiijb0Wtx8oph9x7UAtO8YU2
         jgUUCrhIU6c001kPThkks1+XITH2v6b7l5RQ5esO9jjPmPrZS78MkxXWs11RE4s8YmOM
         HB9xpwASOY/X+bQ0+0O1yguIfWaR19jfnsilqY6BurbgxA0WfaMvxfWglloVNmOLa5ub
         pn7w==
X-Forwarded-Encrypted: i=1; AL+hErGJ2LH4GYmQqw8N1GhApn/zA66Xk2rhK/LfTit1Nc4FPtGV3w9zH0k16h6oxEC2Jq6cxRh08Sw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Md16hXaai8QE89giu37V9mTcX614sdz70iPYiuYGtyq/EOt+s
	eNBlAaaBfTz5K9huUOzepGoUoU0AdUfjKJqk3U6YdRvcZ5fJfXs21keXDekcaMuoxBdLpEnP4S6
	GQXOaTQ==
X-Received: from pfdb13.prod.google.com ([2002:a05:6a00:94ed:b0:89f:41ff:99c0])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:14c3:b0:89e:779b:d0f
 with SMTP id d2e1a72fcca58-8c87ce3165emr7009702b3a.37.1795286353159; Sat, 21
 Nov 2026 10:39:13 -0800 (PST)
Date: Sat, 21 Nov 2026 18:39:12 +0000
In-Reply-To: <20261118101752.1989502-1-bsdhenrymartin@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261118101752.1989502-1-bsdhenrymartin@gmail.com>
Message-ID: <awHkoGTQ71NbCeU0@google.com>
Subject: Re: [PATCH net] net: initialize sk_peer_lock in cloned sockets
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Henry Martin <bsdhenrymartin@gmail.com>
Cc: Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, 18 Nov 2026 18:17:52 +0800, Henry Martin wrote:
> sock_copy() clones a struct sock with two memcpys that both include
> sk_peer_lock.  sk_clone() re-initializes sk_lock, but nothing resets
> sk_peer_lock, so a clone created while the parent's sk_peer_lock is held
> inherits the lock in the locked state.
> 
> The first getsockopt(SO_PEERCRED) on such a child spins forever in
> queued_spin_lock_slowpath().  spin_lock() disables preemption, so the
> task never schedules and its CPU stops reporting quiescent states; RCU
> grace periods then stop and callers of synchronize_rcu(), such as
> expand_files() from accept(), hang.
> 
> Initialize sk_peer_lock explicitly for the clone.
> 
> This issue was discovered by Tencent CodeBuddy Security.
> 
> Fixes: 35306eb23814 ("af_unix: fix races in sk_peer_pid and sk_peer_cred accesses")
> Cc: stable@vger.kernel.org
> Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
> Reviewed-by: Eric Dumazet <edumazet@kernel.org>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>

As Eric mentioned in v1, restricting SO_PEERCRED etc to AF_UNIX
and AF_BLUETOOTH makes more sense.
