Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794673734;
	b=qvmskCC+LBgxdtIb8oaZApBrKvfrMmrTCFZv6RLfW0gKblOh8HiWjd4pwb+20E3KIwij
	 8JWKKHWZmhHUEiUsGWuIegLzzolgaV1lGVflky1TwTD6Mpde6LFUJt8lKCcbP8f1jtjzA
	 QQ7EwibKUuEcJTQvX75LYxoD6BNJzZ3O5t/I/Cma7dhXkLFdBWpcUanKA/hmzRA7FchRr
	 aADZ0YEKcvnWZWLe46lHtnhotELOFWIsBqzsUBP5pzWQaDl1vGaupr841mSH0/dxHh5io
	 Kse6BxpgTsZZIURQplaHGGsBQQqnqLu2PAEbUwGpCXt2prfsbV1/aNl/Q3AiHygnp+g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794673734;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fhEz7jamMKCmwsixi+Ij3hAkM3Z9cVZ4jyi4ZnXszm8=;
	b=gHsV4GP6dSWtwlGECbVEU0CYbl3utrGNYrNdd9E7/0SltWPBRc/nMQipONlEkDFqqj/o
	 0A3gWnblTj5MyQ/fv1ol5m2EWYX+jIwgiHQr6C0DqqCgbZbRqls5UiuiVxx6n9oAdYGlV
	 Jh5trKtmDHg2di89rgXM/EFADOopCB02WybEHkiW3hZhpGmOUKOBiVbhZSQ3P9Q61v8U2
	 A/WmDNgNw50SIeR2MZZdWQineE/0VTANA7eD6G7Ajp2U/YY/6gX+XbwGkJcxMQWwxcfj5
	 zzqcGQrjhUrTaEsKcnNJtl0DyytepvbQADZv56zg1LjRe+NZx34lFIzXOYkOjhRAXAA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MmO0g1YQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC6F606A329
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 16:28:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CC6F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MmO0g1YQ
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-170135e43c7so3017953c88.0
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 08:28:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794673733; cv=none;
        d=google.com; s=arc-20260327;
        b=MIbd0TIsCWZMWFkaw/jofUkfRm+dCx4K4TIxK34UfRUgFLUbknX9d4WrXwavffkdXv
         vWCMojtsrzumAp8Q+3f1+2GT4jMHWwe+LPfbfTRJdS9HAbDuHEKpRzUWIypr9dI8frUq
         wEqW0+bIhjlOaZLKSP9AMFnqHHTpZ+azfKk9pgY1Iri4d3hkq30uTjQFRu53G5fMuqk3
         zwpfENruJtQ+YRzp8n3E3H6Puok8l9cSfaR87vnkyzPLycbaTDpx7ig3bhoLk4L9oVgs
         JlCUqsgQZ6of7vVkBeoxu4npkS/azauJr15HnQnJ+atLS7ONeBlsQYtqYSrgiLm+a816
         qN7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fhEz7jamMKCmwsixi+Ij3hAkM3Z9cVZ4jyi4ZnXszm8=;
        fh=Smk6RATpix4CKDKjmTlh2d/sxeL63me4OR894a0kZRE=;
        b=lcdU4WpL7qsGUCmpjWq4Vt1GI/Wxqx6LcPfbA+Nw+pWcRqMVbr1o5BKHSKueHBXUwh
         QZMQ25u0k+2MahjzFdN4XyTC4svu7rEiY+PntO2k1FthDeR7ebRLbcOwT5uWub6g8I+F
         Sk3uMX+Pq2Ct+6YdzUEPpY7fUGjd0WN70pXBTR05alRWam8YvCrurYS141iDSkbX09r+
         iO4c4Mgj7gRKDKfVd1YIRrwiyGUX9vXa7I/crjJEQMT9vrssO3sLOqf263t3EaPTLke9
         1WIdeeportjH/Odc0OMo5ikGAkmHQfpz7zJc/82EnyC3VSzrG8rVzBngkF+owNiQZW6K
         UU8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794673733; x=1795278533; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fhEz7jamMKCmwsixi+Ij3hAkM3Z9cVZ4jyi4ZnXszm8=;
        b=MmO0g1YQPiGdxVBsFg7TKeAlTOx2D5cSIxxYP/IP7+UiwDwB0Lzp0qvl1ruYMDZn5Q
         Nn/Fm8MuEvVbdpMKEx2fgUDfLlOmXTYjtnBcQ1DkqsItKmzN1SGeKtqByykvzUtNwRfN
         S9yaKF3rMqzh9L8mVMAztLBqsHfAm+svrR6vMX+9P1PsRJLMeLXWmMz4CTiZN2yzTbZu
         Mv6xX0qURhrDp8iefNZDFMCpOj5hFb3jROlAcwvnwLScxfGsQ3g96g3DIxKy1jlcPT3Q
         xD0/UVtMz5rg++ZAsMyoUe77TcPafWmJHxsVHdd9LrG8pw2ZcizO3NGfdQ7WQMPCJbQf
         DtSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794673733; x=1795278533;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fhEz7jamMKCmwsixi+Ij3hAkM3Z9cVZ4jyi4ZnXszm8=;
        b=CUNs+LbGKqHRaHhGZNpTlYvHKl3hWX1+gCLm5mksKHgbeHsf7/d9jpUbYshExsHNQM
         dIn0sHTISf9MtMFOFti+0j3PAhqDOFmoVsp0owyAYZ1CokOdjg3Dj+mwOvq1g/l5tX0T
         wfuGqNl1CzKj5HF56N21O5snDG8somJDRx8KA6eIze0BE8E/dIp8Iz993ttvXYPyyBWN
         VsJ2IQrdTmTVvArwGwOSyzWHKs33eT0dwbDpIOG120Xe/LRDvOPIShQ7OfvejZsLnSLi
         ju/2vuUlGfRnDoqT8QdKuHkKqRIQ1jXaRzUOz5Mdvu68spM9q9M6sSFDJHjpELdy5kMM
         0D4Q==
X-Forwarded-Encrypted: i=1; AL+hErG+qW1eIAmfEaS8gtAOhSiw0SLHphmx/61I6XWaMyhVKAoTTizkR/VdNsWpPOt9E7XdtBjNVF8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Tvw5fSYkmGCbxr5+4aLh2dz9QTg84W10OgigdOG4f9A4Xn8vf
	bnXoKy8oEZZg8iOaUCT0wBmYowex3cmn7B4IQ6rHlBnmcyZYuFDY6vVoQvAzgikJsQgHoI65rCL
	G+pOws/ZRszDwT2TUHKH3kCFu5zvpWLFcn/rP5hmJ
X-Gm-Gg: AYBFou3UG6KpC2bswLgnoOoy+8fagSTowNuK+ORu9SNJTXQQLNcRjOCpedc+U/OVf2F
	NN9mKWmzY99v9GhkpCstfynpZf6OvQyyeMmosUUfZ56LFiiXlsJnWHpGuOZ4JxSOWYrp3v6aPLq
	eMAnjlwwnYSyd+R8hwx9yi9btYbAW6LHfir8Znyc0d0QWsWdTyf1t0AISqwIj9kReHfzTuLJzb7
	7vdR2VY2enAN9x8L/4sz3cW6reXnFaGk/0yZ5qce/W+ixiSKzJL8X9/1p1fMrLMUvDGcOjlh+b0
	/wcqdRcPkIM3uySetBuSpquEV1bP3hD+MfYYkyFyoK2ogFLObq6yfVjPKD9zZsqYYAtaU/miZdt
	Am2mpwhSWYI+rnW2433NV6L20cNPfG4foQkBIs3GEp7+ueqXP+e8zorOFv3goJfV48sPPhYAUER
	uUMh+NQwCrlnl4PcVWmCvdXMv353GsJrZtneqGspinWOMHC2lPsx0YS2M8XoSpfGOB0CmI+/Ga6
	UolKwrq3w==
X-Received: by 2002:a05:7022:2390:b0:18d:96e8:b913 with SMTP id
 a92af1059eb24-1b503195191mr8358359c88.47.1794673732155; Sat, 14 Nov 2026
 08:28:52 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114155150.235743-1-edumazet@kernel.org> <20261114155150.235743-2-edumazet@kernel.org>
In-Reply-To: <20261114155150.235743-2-edumazet@kernel.org>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Sat, 14 Nov 2026 08:28:41 -0800
X-Gm-Features: AclHuK-NaIdeMoKd9bNTVBrUhFuHZ7iGJ6TLWjyyIM-skVqbnoAqEwOOhdxTdyU
Message-ID: <CAAVpQUDGALyfHnHdqEwE+VxYqZAuET=Y2j7i-FSX4zHwmN_GXQ@mail.gmail.com>
Subject: Re: [PATCH net-next 1/5] tcp: add TCPRcvCollapseSkipped counter
To: Eric Dumazet <edumazet@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Neal Cardwell <ncardwell@google.com>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 7:52=E2=80=AFAM Eric Dumazet <edumazet@kernel.org> =
wrote:
>
> Commit c2213d9b61c1 ("tcp: rate limit receive queue collapsing") rate
> limits collapsing in tcp_prune_queue(): it is only attempted when at
> least 1/8 of sk_rcvbuf of new memory was queued in the receive queues
> since the previous collapse.
>
> Add a TcpExtTCPRcvCollapseSkipped counter, incremented when a collapse
> is skipped for this reason. A high rate can indicate a peer repeatedly
> sending segments that can not be queued.
>
> Signed-off-by: Eric Dumazet <edumazet@kernel.org>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
