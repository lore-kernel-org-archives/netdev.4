Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794672720;
	b=ZXMQxiFjz1NHd0R8avpGVO0YC96knh/Ko57NtMLFkRYqCJeJKOvEljCWKtsoyQCRawgM
	 u+sXqgiKPRiSXickd8xyd7j/JU43tb2YD4EwwUgQ75d4+Kt+UyneDXWfAuzJej5qYH3nh
	 dba2eq78f7aLn4LHie0YL0mHyoRiMCijVnkMYyEzzj7VPRZe+NCC6uq8QqYE/4/hdFZ8p
	 zDUchsbVDI1FkiMpTEpffDN3bqEKmMnt26AO2LYPoqwDYq8Vf717A7AcYOyKR0LQ3McrU
	 MKVFstGXdriCqyQjwH41Or801xC5fOvdrTQxxGPOS1tGeI3TncamVIHqfUP6SAp0Jyg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794672720;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rAXOsiY7dgF8E9nvWQfWLqo1mF0hHpyBG3jPK7/IHMQ=;
	b=wqrGnRBIZxxIIywmwDxXU+TkwZ1H/v6LpftC89vvKut9POvL8SOjntPH8zx+cWWxQG8E
	 U4HjIxDCTVc47hU8Va+0HNdMoD6SYdUzj1s4Fric3G0G3CmlWa6nKJWCsA2mXUZ0xMhng
	 wwbV2X+5IpOltW5SzV6UTjzXGCBICHuTt7QXNJbWtB5ru8+xzlhSCecSJ2AuLCN/Q+7dz
	 9xnoof3ctwQldvEgnXBcnd3IfTYIwOXWQ/IR9G75hl1wvqr5oroyPTAXEnBLWKf+50a7J
	 HwwekI+Rtoi5h00bW5+7GXduyO/T+PxNheksVf3f7ZSw6q18HJZUzOnLoZEjoTgEOcQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bCmLBMrs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83368606A330
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 16:11:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83368606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bCmLBMrs
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-54492d8a988so108241cf.0
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 08:11:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794672718; cv=none;
        d=google.com; s=arc-20260327;
        b=JtN4JtpmY119V5atUJynYnpazVoLW4uICyYIk83zW8gZlXX9PWG1SISrPN0X58ePvl
         vVv4Gp1nFkfQxKSx4h1GgRc2yaXTQBCLuiS/cfTEdXWA5+zL8uhKRFwpaVcXwfaipAcq
         YRzbKxdgMCOe01CysyhbqqTr3TNE4vDOPBPl5FNusytTql5cbVzi/FKj8TR+pKO/ZkHe
         YYRCWFmQOODWyUDsLOXoxni6ggODuywf0zkSpz+um/JrHFGqQEa/1kz0WXVeS4+Wdwwn
         Id+7hF/1P+LRbt0bBlyEL5hQr9XFP00MwFW+BHIVci586FyUrkE/lojwpVPtN+tGYfYs
         lDoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rAXOsiY7dgF8E9nvWQfWLqo1mF0hHpyBG3jPK7/IHMQ=;
        fh=jowRCpWPLyzo1+fQECi/tevxGeiOv9P0qQN4JXaJ6Ps=;
        b=MOddEt0tIDeQzTuBE3qOWi0AmgG7Ie3c1N3MPZtNG/JQB6dKS4YGHnNKwExWqD+iEH
         marC2YMJ2tbqNFgJZzgk4fSZBwDMUhsMEBmhviFFZk5RnYdJX3zV58SEADWP0cK3m0ls
         Ex3hFB0NL0Pk8hz67Jn9wX+wlRoHkKjyxXr98Q2I2S2OcHKlS+O5CLJpaZ7/4HgfPZ3P
         aJCBq5knQ1Ocd5INBgcg6JSA+o6ZJ5/vJEe6jeCfE8KVx2UqCCPbx8rj6AnlWQNdt08s
         CYeZYYp24IZfLj4lp+jBSgWpMQwcaChaAI1mBbvcLw3c2H39tsYR1+ej4zHbstS++QF5
         6LTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794672718; x=1795277518; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rAXOsiY7dgF8E9nvWQfWLqo1mF0hHpyBG3jPK7/IHMQ=;
        b=bCmLBMrsoS+E3FJJS14wew7hWIzp/cpZA9aiKnclbK84765KkPFQee3u3wA/T/u+/e
         Bo+/LU+J7yY8R5ef1Nk0gTxuxnjUT3vuIwzINP7WEWgIvcBUSnN3GuU9dvzsUq2dGtks
         jfWz63UG9DdqOtOTHwd6lGqOm4Z6zzPdtdOY8pJtf3Knv3LM3yUHrl2mjfZ0HAlH83Hn
         iQt9L5+xs99sc4ist1nJ0zfTFqgYoaM/OBm4uKtKqkM3oKRhTX8oc3YgJ2p7w/TYVTBy
         FjZ+qy2L1c+ZWy9ooKdoCo7qlx3z2rkDAbdEeK+OYnBqX4vOqo7PRBjSocymbAgDnw0R
         B07Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794672718; x=1795277518;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rAXOsiY7dgF8E9nvWQfWLqo1mF0hHpyBG3jPK7/IHMQ=;
        b=A/I4wvpYM59xEZ9xXZpbioK9GtAJHECQXboa65c3lvrjIs4wkRoFx/1d2BLV94NG36
         9l45p03jWWH0xTSZFaCvSCchWI40gFTJ1uD6NuJTOmx3jLeUzK4QKQnCpkKAmqikVMqm
         wnE3xB54jOIG6VWbsImsFd+xQGQM+zvZQAtLD6skEq6zl/sb5VHLT7aZGsPsH2Pz8ic1
         4zUvCyWMFnn0ZVoNp3M7xuwwvwyRBybosKDSOI+DmSvPLAryGZxHEjdcgnB0MS1XhRk0
         KxMnx7SRzCxq/Gfis5WL6uJfZcGYTfF9g/ZBIs2N+w+N4VFEIrOUqXe5TXtSmFZRqstL
         3vXA==
X-Forwarded-Encrypted: i=1; AL+hErEoccNabMExORtMOxchTEtwCPAb+jPOiHQOEKcWw8bmYTc1yZ2Z732SVxYUXuZBE05HbwSI3ic=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CBn4/XCE3Pk0fFaWnUNrpiIyiaVKXRFq8U5JsiH7TrjGTzVPY
	LiNowNP+e1vaWSRCbM4t/69jjgTnKte8VWzvjFyBFKGSe3iLuf7QaDWCB18rjJL3JzpTOQ25KfP
	JJUvaIg3i0UfAOXEOxWIlgEvriuOJSydwfXPnQG2/
X-Gm-Gg: AYBFou1/AMRHwcgckJT1a7+IvCq05Cct/wCxT3IJv0Xc8PBj0RvGaf//wF3DBR4uBnF
	RTsRAk77KUFT2t4MtSJWaeSbCnROX/oUJa2kfXad61n+k49w66C/uHov37ovwJcuwMYooG2bOpO
	a93DihY87eWL4Y7V91/1m5SaJdFT0ImTSAc2pvlpvqHtRg49arBIZ5x1NMQhf/r1aqYTQ26AtWD
	PfukmOMzkuHafmcmgn0aLsN78b2q+uN0Uv1kmGSu2zxS2JECWDqFo7RY2l+LUY45nPFC7olm6Ol
	juTkk8g5uswcsRsVhqyt6XGfPrEILLMAnTT2lvvkQdskLtPO2pn7xNGhg2IWAhPzuQPccEKCPKU
	0O3gVBxiv/0CyhIdKM0DvFc5LJ0C5sWyFHQoIvUtxfXz7B6kWM8fzySsCRG9ukgYq+QrOwpmo6m
	6vmCL2QR4JrbyYPsLRbN/h5BHnc/k=
X-Received: by 2002:a05:622a:1f13:b0:536:353e:8d2a with SMTP id
 d75a77b69052e-55c420acbb5mr16403621cf.1.1794672717702; Sat, 14 Nov 2026
 08:11:57 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-mtu-probing-series-v4-0-6f2e484ca8ea@gmail.com> <20261111-mtu-probing-series-v4-1-6f2e484ca8ea@gmail.com>
In-Reply-To: <20261111-mtu-probing-series-v4-1-6f2e484ca8ea@gmail.com>
From: Neal Cardwell <ncardwell@google.com>
Date: Sat, 14 Nov 2026 11:11:39 -0500
X-Gm-Features: AclHuK_-nV7pf1PB8PO4ykYtxVbAD9myD3UdJz53eZ7VZY4ZOzGRrnnpG944peE
Message-ID: <CADVnQymNTE-Etw4hhAgCAz9B86qzpFye9vZPkE_W62c2hY4Q8A@mail.gmail.com>
Subject: Re: [PATCH net-next v4 1/4] tcp: initialize MTU probing before
 syncing MSS at connection setup
To: echoowall@gmail.com
Cc: pabeni@redhat.com, kuba@kernel.org, shuah@kernel.org, edumazet@kernel.org, 
	horms@kernel.org, kuniyu@google.com, davem@davemloft.net, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	netdev@vger.kernel.org, panweiping3@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 11:46=E2=80=AFAM Yongjian Wang via B4 Relay
<devnull+echoowall.gmail.com@kernel.org> wrote:
>
> From: Yongjian Wang <echoowall@gmail.com>
>
> With tcp_mtu_probing=3D2, a passive connection starts at the full MSS
> rather than tcp_base_mss. The IPv4 and IPv6 syn_recv_sock() paths
> call tcp_sync_mss() before tcp_init_transfer() enables MTU probing.
> With tcp_base_mss=3D1024, the first successful probe can therefore lower
> the MSS from 1460 to 1242. On a black hole path, the first reduction
> skips 1024 and goes straight to 512.
>
> The issue surfaced while developing packetdrill coverage for MTU
> probing and comparing the initial send MSS on active and passive
> IPv4 connections.
>
> Commit 4d83e1773031 ("tcp: delete redundant calls of tcp_mtup_init()")
> removed tcp_mtup_init() from the passive setup paths.
> Commit 27204aaa9dc6
> ("tcp: uniform the set up of sockets after successful connection")
> later moved MTU probing initialization into tcp_init_transfer(),
> away from tcp_sync_mss().
>
> Initialize MTU probing immediately before the existing tcp_sync_mss()
> calls in the IPv4 and IPv6 passive setup paths and when processing
> a SYN-ACK for an active connection. Remove the late initialization
> from tcp_init_transfer(). This lets tcp_sync_mss() apply tcp_base_mss
> without adding another MSS calculation to connection setup. The
> crossed-SYN path already uses this order.
>
> Fixes: 4d83e1773031 ("tcp: delete redundant calls of tcp_mtup_init()")
> Suggested-by: Kuniyuki Iwashima <kuniyu@google.com>
> Suggested-by: Neal Cardwell <ncardwell@google.com>
> Signed-off-by: Yongjian Wang <echoowall@gmail.com>
> Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
> ---

Reviewed-by: Neal Cardwell <ncardwell@google.com>

Thanks!
neal
