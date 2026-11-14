Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794674068;
	b=ANLQg3o5sWN92TZXFZunpUD9DjJ9BGdCY7ubAcUB+WLUjAJzWqQ/MxDxYKO5hNEFBx4L
	 C1zaZKXA/b1Ip97gH9smLPDtpHl2AalvlBqkw0KXNVFIvchcE3AHJL4dGEtITnWtTkJoC
	 B+QvIW8crEPmyrH6FCTgeoaHco45etHsClW7SwIzM3FkzjZuy//sg7RIjhgc+M6bzbTQk
	 ufqyUs7DAiBcnTUJcYBH+iUm4ULfOWXv1oMhmVDb3dJFgtmcR1WSkFdQwd+6xmibbthWl
	 rmtQ76rD3e3+i6DSUwvhfHsDMxkSV2OcIz+x/H+mlQiFc7BorLuwqqrIBWdh2YiAP6Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794674068;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=82FlS5hPUwjudrWN0p/M60u4gx2rRSiMWl/9wK187hg=;
	b=EwiGtqzhX7Z9PsrNq5OvgECOho9kI24Iq+k05p9+/OWyJXE1ELib5lgM5DsfPBFxXuED
	 UHvWShuRjdgfwj+3x9rxXDjfHvR5JLWMl5wc9UgMnb1/kVLN1OsO33/A0c1KAvEdn7gXN
	 McmVmz2bAxkb/PXFxtiHpqTbdANxx1hTWQMF87RUYsVRlI1VNQnbNXrVFexCxA7QKHEI4
	 GAPiN8lcKjdyrx0QZzzyF9Yex0K9ahRyvcMlQ9qIVnSBeMb2SMTwOg0zpZ3GHujCwIwS9
	 VWg9QdPz9EMX8ugSB5eXQZc/UX6VnxFOpI1xdgbwEwD6bZV/+NSKOgfUWvIKnInvPng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gfomiNJb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A126C60A260D
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 16:34:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A126C60A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gfomiNJb
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-15dd124bbe7so1718066c88.1
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 08:34:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794674065; cv=none;
        d=google.com; s=arc-20260327;
        b=Fhsxn9In2XsGK/wRFU6W9LkkTpr3hexKnOz8TeCc9hL3EAVyI6STn2EgH7mSj0+J9B
         XEJH1qN0ErU6q7aM3mdql7uAj3Z3qZjuZxxRPlJ9MAataeHN8pSCA+aaEhSZeF8nJPW7
         87VwPz8O9NZQL4QVIBTLnc2hSOG5Xtjy0/w4cIRFO2Yeao10kjI+5YppNAtO3REw8iSF
         coX2LOEk/bACA6t9gcXtIDe8xk7rStpirvuAoI3eAbpYorK5yua75strOXROQStiCcgm
         LnKN761rNEZbIZxQYtyBC9mr3YwiU/PvyY8yW+x082VXVuyORG1W4dYzGsUiBt6e6Syr
         oRGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=82FlS5hPUwjudrWN0p/M60u4gx2rRSiMWl/9wK187hg=;
        fh=4gU6AYbWuRWMJNYfIF4FikJ4jp6LbxOBFt2OJG27vRA=;
        b=WXpQr4E92X2XE1VHMgas5lPqpON28w2WddPVWs1Qha7VC5B1lQVCViwCLUZdOn+yPw
         FJpyi0Xan7nUcfwA7Iebky1+pGnwpRCf+JthLusrqKJaiyUqjih+8mzRIJxGDbZXp/Gs
         u0ryHGGpXerIVQFnKQGbX8NOKaNeett50pi/8bNgGvTgNu2iEMFpHFRKlj7P1JIIiu/M
         mtkHbC9rsJsJqNeSYQImVoyk9SXtGCXhUPgFh9OvfbuNsVMcgt4BvN7nlUyZWGi3oQGk
         LHlqvvTyxEmTDX0TF3FpbZEsW5nNihMFQaJmzrNcTiZnXG0UvbC3L0+qAzQbOZ/1fQG9
         lNAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794674065; x=1795278865; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=82FlS5hPUwjudrWN0p/M60u4gx2rRSiMWl/9wK187hg=;
        b=gfomiNJbjW3jp70+AXH0VUbQEf7ksqkiRZgz2fvsSZa/UFk6UVm4mIzdDVv6AIDi+p
         YPEHa2rRc3yfCi420+OO0QOUmxzXBJK3NB0thj8kD04C306c7W1sX8ZEftx8gQs4E3zz
         CtVpz6ObJdium0WyE1RTzUl5gDLX2igE5ZKMy37oiMmUG+gDThDjMP0tUYIEC/fun2qN
         srFHK0M7F6TxTUAxySIrMyFfz29jxKO/quX+RH2y/4/oi2truRkeC98klmqgwkQuHmib
         w8vxvm8/VTj5rbPvODb6ud4aYb5BceDZA4J5FKMK/6MTBkOQnyiMKDAak+Jhr74CE2eh
         VvBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794674065; x=1795278865;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=82FlS5hPUwjudrWN0p/M60u4gx2rRSiMWl/9wK187hg=;
        b=IdZA/Le1svunerwjnJS9y3+JsEcQNs6ZamzVJlNIreGosID/ejARmMtyh9nO87QgH6
         xcqzMWBz+MIIjO4C9oQmghr7kEa+YlApzZx7nTI7i3wK8tpLcsqnYpk7gcYwjSffUKky
         e1CrQikclg5MNBfZHhVNBKlFidWTxGFROc1u6GeadwgZXwn7PGN0KRdox82esATnZpW/
         VZNMAjaDBN/q7b2P7sJ4Er7qo8RAGA/oF6gif1GurjkZZsYNfxCN5p2rz3rNEPLSL/2O
         g/3PL6AAT+Ub3pBfToC7kVTmtpbZjnRtskmpAtwCnRDgprD0jEfnU6jPfICUL8+0ZoBd
         QJ9Q==
X-Forwarded-Encrypted: i=1; AL+hErEJtS15l+sd1wkGDE4RkYX30OUdaH4/xsEkxx0yTzzb+s84GxQdCJU5+rmbObkRMKmNBV68ojk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+SPOfx2/IxZBOCpt7PkzIJPajOcpBl3OZyOScYSZ6m8naNLZE3
	hDYbyv/5uDp+PzYfIYowZINjhuSVpFwK69zEaJ79JHbEM6N6wVCS0U4Bs7HyeKtDpoIw96a0wMR
	A7jVMsiholi+zeo1ZEpAYW9J1ju++iww3mUBWUjKC
X-Gm-Gg: AYBFou0pK4LdmENfHrmRfLO2JszQzH1i1RaO4AF91joCyL9riKdxqxSpic1h6b+t3hH
	vzWgB2Nol7GF9zxi8xC21R3vVKpngr1+z1qzKy0iOiYNZcf1fQV/AFVwKJCk2yzcWbATKx6Or3f
	zexngmiZVIdEhVIUy3ZO3eOCJkIGoJPxALkpzh5Bo7sn3RTGHS8gFmAml7bQdvuPuo+YZHhbheG
	uFwtBZJxGCciLqEbM1DfBH4tBjs77zP5zzMhbTm/EL6YAwVn2houykBQNR5PRVs1IncFG3E5jvk
	RTFPLPORrdrQG/0HhLM4Ba+EbhST/nhsi9m/UPU5w4cTKAKi9zb37LUqcKqe7phVyespVKvcVuD
	fw+9x8ERdwanDiFk5k2KtnxM+3KEf7NpPOjbGIx385PK2pAip1dKNZR0u9r+kX6o2ImnYGMPgCt
	B3yh/lcwWzmGR2u0MVooy8zDDbi4D1o9m0K2jMgcpVoFKVQMRSqkT+umn3XBWHy1Udc65MRTPu7
	J064dCSwDIctZhgBqMbzmMQOFVvrV4=
X-Received: by 2002:a05:7022:7f0f:b0:193:9aa3:4758 with SMTP id
 a92af1059eb24-1b50308b532mr5919023c88.4.1794674063874; Sat, 14 Nov 2026
 08:34:23 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114155150.235743-1-edumazet@kernel.org> <20261114155150.235743-3-edumazet@kernel.org>
In-Reply-To: <20261114155150.235743-3-edumazet@kernel.org>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Sat, 14 Nov 2026 08:34:12 -0800
X-Gm-Features: AclHuK8Ii1nAoaemQwINh7evMoH-FETHnjNY2citKBZolhz0948I93CCizLd4zc
Message-ID: <CAAVpQUDhOSWpcKR6KW2n7nRMuzajULTFVaMXgOE_K6DxHY3++g@mail.gmail.com>
Subject: Re: [PATCH net-next 2/5] selftests/net: packetdrill: add tcp_rcv_collapse_ratelimit.pkt
To: Eric Dumazet <edumazet@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Neal Cardwell <ncardwell@google.com>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 7:52=E2=80=AFAM Eric Dumazet <edumazet@kernel.org> =
wrote:
>
> Fill the out-of-order queue of a socket with a small locked receive
> buffer, then send 10 times a new segment landing last in the
> out-of-order queue. Check that no collapse is attempted for these
> segments (TcpExtTCPRcvCollapseSkipped), and that filling the hole
> still lets the application read data.
>
> Signed-off-by: Eric Dumazet <edumazet@kernel.org>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>

Saving outgoing ACKs is an interesting trick.
