Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.218.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795484287;
	b=cxxxDWIHak59OZJe71pZ3+EY07uI050nOX0DLK65Mju7buu6k+Jlyc4EkxzzAL2dIEhU
	 1AuLuD3dQYBt9dJCdGMtO1G+oaI+XZHJ/vDZ0ZCNhuHfG+hQu+7B5DAR1qtvdQjRY1LFt
	 Q2FOf4GmiFP6aUaIxQGdqidnXhbM0SH+eVyZ/KZ+v6yiw1PwyJYxsuiY349F0vrxLgxzp
	 wrTehJHUS6/8ohB7Rw1zr9ohjf78dBELgMOMO8wxgHz05SoELPEi5rcvfENH0kRD4p4zn
	 qoEFWK5h21YDSw2VkoPBq+pWW4nqall8WyOeRZpD0+uT3T/OxrLAAdMYc43tp6Y/cKw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795484287;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=CeBZ+wB4osLNJC9vxHHe7mdPF1D6RlCzCGZmdvMDBkY=;
	b=uT18mPoK1gp7IsjXsT7eN6g27o0Nm/3k9T6G7Un3adMsscbUf5G7f7CHm2qxILZsoLAL
	 Ap86fCxT6aAJIRV9MtXB2+cNDVy0jvz1Q0oRJkYGU/gYIdJebUWXUfPhrBOvjNXUEWdcA
	 4zFMxlsmr6qOLwDnQSEL5NUQM6MrvdWeWX6zQiFEEvjHf2FEylUk2rzIsgGS1LST2XeyS
	 zyY6ep87RKrukk6zYMUPJpcg3YWy7vUD7eKxHcMkQfbrSrqUapGMu+I5yjtxaijxkn37C
	 i9ieaxmVQMCqQj4BEpS12fACgtS8KakwOeHb14jOY+B1A1rzSUo6M+bX8YI45NMwcZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZzpexupX;
	arc=fail smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E82606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 01:38:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31E82606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZzpexupX
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c50e26763a4so734845466b.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 17:38:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795484285; cv=none;
        d=google.com; s=arc-20260327;
        b=e5mx7lpIE8vSYoTjatlIKEViGW8UuyUmF0BXXyhUu1Xxq7sl5DsrkFsd2kmEeFdrqt
         RWvY6gwMkBIfV7lqH2i18g2f7GCTf2cADA4YGicnGjWHcctv/Gbpa5WeAXzNkuzGWyH6
         bKTytiZ7TOwkfWZvNLs0eZzu0e1erlVNwE0j6/iljGU/ZqvX4IEpzY4DlHfLf/4J9MAl
         PAXymg2+ZxFI/TLaRdl/DCQn7gayByahwXJVfnS6uQ0hpQR6tNKHQcDHyTg8ZcytX8wc
         ATSQDfU2ZczZT3TKw9F9ytR8u/pWH/tjM6qzwXatnHcBnmDLcJ7nuHRyQlfTr+seVjE0
         f89w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CeBZ+wB4osLNJC9vxHHe7mdPF1D6RlCzCGZmdvMDBkY=;
        fh=26w0nYLISU5uwluFqUm9I3mXEUZtW2SQ1h+nNc4enys=;
        b=DDMXvVCe/em/ImUlB4uhy7O5rEIW4mX9kiRQ4nW2CxfD8h8k6G+IiJeTlfUgNfhjvK
         /Wb+qgFlu8iXdnPb5TNrFyY77KLAltreIelVfMupPqbEl15iWH1O+EwaQggigFYRgGSI
         LBAs6XFOrMv3cVEpuaT8BBkhDxTEicKh0hj77UhNJPsOLJIBjr6XLemdmSTIjq9XlL7f
         NOtWFRLA/wMK6dBpW3Umu1DY4XrS3RwM4kzaNzG8VcavgjwL12dlfLrOd+ruCPTrUBTj
         fOPzdst9r7Wltd1yl2O/8AmtGplMoJsNxWGFQt1gc+Tky7E+OikRkESYi3cO8uPFYsRi
         y4Zg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795484285; x=1796089085; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CeBZ+wB4osLNJC9vxHHe7mdPF1D6RlCzCGZmdvMDBkY=;
        b=ZzpexupXNdSMdJcbsGzEAl2ynnn1WqZ8YCPaIIpBdWXNJr6VOnrYrLu0RLtAiNpqSd
         TV7EEKD1Ev2i+u5k9Hd2Sd0hwyP7OjWA48PGYYlgIC3YgW+HU446L72VieDpHRGF20qp
         XlcSqtiNYMHlVImQ9SfwlXds+4e2gFsQbRKX/mlw0PZOKA6/0c7Rgo1wEy8uBIozcOgb
         V21xTABJbjVrNd2cmN2mB8OEAbmmmj9S/TRWA2gzQ6o2i4XQB8GIig/HAJqCTIiT8/Os
         LwGsegnHZW63Q5T3tY26MBQWJ6eie5UqO7cj6S1rc1++9eeVPCIfi6rYHwMMEoD9Fdma
         b2Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795484285; x=1796089085;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CeBZ+wB4osLNJC9vxHHe7mdPF1D6RlCzCGZmdvMDBkY=;
        b=XyCCiSJpIgLDIO0l7mCanv52gIpNlrSOvBaMvyDcOaJRx0y89zH74Q6625gN+kycym
         KGq3IooqlOsuL/D6NXL/SbxO7VuQGXidc+WObLLaZ/8nNX4z4dLJe+vrySioL8Y+835R
         oy9/wTcvQsuftM1T0ntntZymJ++dfpQJcPzcmLuTD3QAWr2Z/1tBIj9RBf+4UcGgIdSq
         Q1klTR5secHRFmLJbcy+zj3fiRgS1qfaJpO7eGYm5l83XPhcYkEjwZeP83OiHBQA+KKo
         Rb4RR6RYCUApFpexMGxdXKt4ad9b5SXCNbg0lROOadX0//HDX1sQpDujbltt6tcNRvAa
         aURg==
X-Forwarded-Encrypted: i=1; AL+hErEKm4sWxUcDPUJeM6cQdEeO5own62ECnQVMGvWNx29q7t8cOi0kkqyF6xj/j22N5EHqLhSGtlE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LPmlFpotDGaz1/sDpoiO8oRuArItI1d0LggybF+0DtFKSNpVA
	P8L2u9OXU87P0RtBUjmrF8UICfXd0EbG/du/OJkfKh0Yg0elhR4HbNjdyzlKnvPMOwpIIlBt6Te
	AwY9bwQVYLAZNvb3GwHKEkORfeJ3dMbs=
X-Gm-Gg: AZFdTZcdk/Hpd7YesgErRZZMnocMSQZy7MMz0fbwQIvnOsoDC727uttOPQ8pzSmFZBm
	+WprdFAxFrUFmWpuDMAUn4dy4rwj9NdmNQ4plq9oTpruZbLrlcZUiheQJB+nloPDdBHUqNvROIm
	tf+jogZz94y8Ln36ZZorCC56u22MDy8I2GyDGaHoCsn4BVLK7uQAwdHbl+hcczE1jHA9V6klOE+
	EffBOBUXgB9+utrRue8z2X69VGZLkF1SX+TEiU4CZcTX0TKUnY1eca0+FaoEP+P5wX38BoxZh3F
	Ryp/hGtTtpax2Q8rNAd+NWtWQnK3DPi36IiadCzreu4fe8YWLYvDW0741BtBA68BjJGzlLMkpj3
	hhqZp80LqvvEOrla02l57wg1QCNnFaThkMBWuscbhnIUR1xS3wSNYs0pKcpx47hwPQm1X/+Cj/J
	XjjdcHKPvAhbwHiLZ/4qgG3sWym8Ocmdl8EIXqaeWPzCf0QBzxAZtDkVSxNvF32fmUeXMmC29zP
	E8KdVCxXOvoNcS3fIE98gtlQvZMQmOCu1oZjjuw90itKu8xbUTE12kDztk7
X-Received: by 2002:a17:907:3e89:b0:c51:3bfa:8d3b with SMTP id
 a640c23a62f3a-c513bfa8f32mr1086885566b.37.1795484285405; Mon, 23 Nov 2026
 17:38:05 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123034047.56745-1-dennylin0707@gmail.com>
In-Reply-To: <20261123034047.56745-1-dennylin0707@gmail.com>
From: Dmitry Safonov <0x7f454c46@gmail.com>
Date: Tue, 24 Nov 2026 01:37:54 +0000
X-Gm-Features: Aa3M54qHippd-OgCM6-bCpivi302Ub78TymwXFLdPF0aHrFSViGlxdqBunnR_j0
Message-ID: <CAJwJo6a8ERv3ua02u4hU++zENBUFftDX4KrabX91Py0LGPF9Kw@mail.gmail.com>
Subject: Re: [PATCH v2 net] net/tcp-ao: fix reset key lookup for IPv4 segments
 on IPv6 listeners
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: edumazet@kernel.org, ncardwell@google.com, kuniyu@google.com, 
	davem@davemloft.net, dsahern@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, fruggeri@arista.com, noureddine@arista.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Nov 2026 at 03:41, Hungyu Lin <dennylin0707@gmail.com> wrote:
>
> tcp_ao_prepare_reset() looks up the key for a reset that is sent on
> behalf of a listener by the address of the peer. It takes that address
> from the IPv6 header whenever the listener is an AF_INET6 socket, also
> when the segment is an IPv4 one that arrived on a dual-stack listener.
> The address is then read from the middle of the IPv4 header, the key of
> the peer is not found and the reset is not sent.
>
> The v4-mapped check that follows does not help: it looks at
> sk->sk_v6_daddr, which is the unspecified address for a listener, and
> it runs after the address has been picked.
>
> Take the family and the address from the protocol of the segment
> instead of the family of the socket.
>
> Fixes: 06b22ef29591 ("net/tcp: Wire TCP-AO to request sockets")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>

Acked-by: Dmitry Safonov <0x7f454c46@gmail.com>

Thanks! IPv4 on dual-stack sockets historically got less test
coverage, unfortunately. Eric's proposal to cover it with selftests in
net-next would be ideal, unsure how easy it would be to add not only
IPv6- and IPv4-centered tests, but also the mixed ones.

Thanks,
             Dmitry
