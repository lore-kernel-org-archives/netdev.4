Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795657695;
	b=jKq+jk2MZYzjljpRoxj3r6DUCYB5S0x5AUVbICnAwb2hY1phzld4jcxxq1swIMWEOogd
	 EHSjj3xEk6PYBc0eemK5IDuBHRqu1l8CNxtJ6hfJu9Lx2RcCq/jhcjVSCf6U5Z5iw+R0a
	 iGK1wqQ1cU7JqQ8HvTWU6iFa+1+WqFHaz4d/G0Rjr4SC+Ei+Nv9vU9Pb0C5Du9f9MhHkY
	 mi4fLlwBmXSRp3MXdycslMZkhT1QoYeYj2N2J0LmKhIJzE/VVyggHMiUyVavBJSxfj6Pn
	 IZG14r3/ncxP3aaetC4YoTYvNDcBS8bAEmbD3jqIbFAHfsgYQmnGmRfSkYOqIXRMcng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795657695;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=nUJLL1/RlgoRivRK2dpdBrsALcrfanNrSQ8uIKqCXQM=;
	b=luGQHNVj4+LH4TcUPjY3W4QlXV8I1EF6jF7IvZfzNaMXF2xXgaIlTKORgIUURCc8mOIZ
	 1v0m8YMbxm+oaiQJ7AYdvhbgdOuxu5GGHdTH43FJUOP+oNnAJQe5+fFuWeGr/I1JH44MS
	 2JW309eOFn1hoWbBbXc6mBclQBu/F//NSIKIrrXDc3MRbrjQ1hA5mp73Ctqu8jRrqw2rW
	 3JzX8qXcmSkAUuhLyjUdji1juh371V5WUc2xCINM0EJSmIG0YyC3mXfrXL496wfvzX+Dp
	 iydxEqlxuhTqa3D6T5OsT0YZTa6KaSAaQ1DuMjwFjTpaXYG5eDCmRdsD0avkxoI4Vkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--willemb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iB5CTUTf;
	arc=none smtp.remote-ip=209.85.219.70
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5089606A335
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 01:48:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5089606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willemb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iB5CTUTf
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-92104826f9bso118667276d6.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 17:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795657693; x=1796262493; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nUJLL1/RlgoRivRK2dpdBrsALcrfanNrSQ8uIKqCXQM=;
        b=iB5CTUTfGL0gPiI65+yFfeeJO/10K9pM2ZX7a9zLbz5TiTdbn5bQNsTkbNKFAWBqHH
         R4e0tmW2nMPMrT3OZW2NalEI979IufOMDYk4trspcOjFU3RkRdvoGf1O52UKD843d2N4
         HszFHa4SPMsiHRJrTjaaZKmQ6hK5qBFy+vfEH+vXOPREF+z6QL7AwS/fdm1KWAXAIvAL
         zdYDPGVNlI6bBeqhLx/TZySu8A4XXCItfIicysjPs3o1ecEWA/R32NDi8J3dMkv9jRTJ
         SI4tKT3AaNfbQ4FvA49v5hpX7klhTjgVWzYvK+rToMp0+8U9GBrAoHIWn5kfCF3wY8tB
         dGcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795657693; x=1796262493;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nUJLL1/RlgoRivRK2dpdBrsALcrfanNrSQ8uIKqCXQM=;
        b=vOSEolSeZwJ0r2dEr4kUOXh1I+wGefOIl7o4yJtDbfnmp5d0buvG6bQS12/TWqI1Ik
         OT4UNfnLkal/g0P4Dax2MgWLo6U/luY+/P7gy2FkY/I6DAIif7zgZGA3HYI27uIbHRpd
         MEYkqlYbBjK5A8Mnvsq3Q3p8tsXNhOGu5OzaL4M6HyM4tCwQev2tA8VvhRwy8guzpkbD
         qTngLcQg/BVRol56rZvK6qc61CU5Zss3hSzPQ/Pk5K6ysULrie/nAxV6dHSz0fk5gnF2
         G4kiHjSVO34seAGED2AeEK7zgJ7up5pITk2wN4yq9fjcisfuORgueWiDuQlDbcHul9ie
         +T6w==
X-Forwarded-Encrypted: i=1; AL+hErFWdHoDzp8RarOGyi2MnPh48n94zazVUK235AGJbCD+Jy6L7BBOIPkslRF8R31ebT8+2IljZrI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+SOor7iAj5f+M7eMckK1jETQMOFnRxGfJSplpYoImCDEdbkw7n
	ZEjU7DccheITjAiKz5Iw3GnpMZP+yYJf3A4LN/j/S5qwFxMPrZ1ndJN5SUBwNZQ6/oLZbOEqdFT
	dnity2dnVhw==
X-Received: from qvnu13.prod.google.com ([2002:a0c:f88d:0:b0:921:1046:1576])
 (user=willemb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6214:8609:b0:921:332b:a4ea
 with SMTP id 6a1803df08f44-92134b38d73mr347232326d6.34.1795657693329; Wed, 25
 Nov 2026 17:48:13 -0800 (PST)
Date: Wed, 25 Nov 2026 20:48:12 -0500
In-Reply-To: <20261120122348.207708-1-mdshahid03@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261120122348.207708-1-mdshahid03@gmail.com>
Message-ID: <willemb.2909963e120e6@google.com>
Subject: Re: [PATCH] tcp: fix division by zero in tcp_cong_avoid_ai()
From: willemb@google.com
To: mdshahid03@gmail.com, edumazet@google.com, ncardwell@google.com, 
	kuniyu@google.com, davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com
Cc: horms@kernel.org, netdev@vger.kernel.org, 
	Mohammad Shahid <mdshahid03@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

mdshahid03@ wrote:
> From: Mohammad Shahid <mdshahid03@gmail.com>

> The tcp_cong_avoid_ai() function divides snd_cwnd_cnt by the
> argument w without checking whether w is zero.

> Since w is an unsigned value, the condition tp->snd_cwnd_cnt
> >=w does not prevent division by zero when w is zero.

> This function is also exposed as BPF kfunc, and the BPF
> verifier does not enforce a nonzero value for this argunement

> Return early when w is zero to avoid divison by zero.

> Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>

Please resubmit, with

- A target tree: [PATCH net]

- A Fixes tag, likely e78aea8b2170 ("bpf: tcp: Put some tcp cong functions  
in allowlist for bpf-tcp-cc")

- Commit message typos addressed and core of your response merged into
the main commit.

- Cc also bpf@vger.kernel.org

--

pw-bot: cr
