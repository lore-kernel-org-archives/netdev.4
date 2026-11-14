Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794672880;
	b=yFv9cdesqScZeW4Z2aQkWAkzqPVdFkq9s/hszpJQImfIU4tj44BAmm9T2W7NYd+axC9d
	 ut3ZHB1flP00bG86a/JI1sEtzdCIXRYnPFeWrjrK1/w1UQ69nEMRG1f4qo+/rz+Mpho+a
	 8jTzPAt7E2vpXzZzDXIeZ80fgusgePUrVjgtW8TKyEY2PL1DiGThmrHretD+JnCnMLN3o
	 0acG51D2unGYrTghuzZVkQ3DYXKxlX55X1UfReUc1qcqKoOr4Afu18Z+VjZ6TtXmgpYT6
	 pVmHcelpNmsEl61EsJnP1xQMJMLYbgeSktcNbcr+SSaP52oXwm8DJ5bR10i6mOu4Dgw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794672880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=j8apjl5nKZpbhUKAqnsuXWh8fD6xWu4DQgoUsG2JJJo=;
	b=2ArxBazuApjKay42M/PXlV7lW1YLUgabQZK7JOjhP54ceTeQ32UwCI8yFUNWdeSdfCq8
	 kYG9p2yhuiYZ0hXRQ1WlLp+bEtO/4200mXhRz4PDbii4KSdAQJPF8AeR4DqUmsgE2Jrzw
	 PrqLZjpXKNQadxBBghxYpYDxPE2XFAxqfpWJZtps5PgQOapcw+nOw9Lq7uNkQTljQSNoA
	 Dlmg4E6HtIB5T4ojVSZ1vPK1yzCmKYJHq57QmuFwZ/6fH/W7wbL+vABwHdmDKFbO26TK7
	 aruGQgWqOVjGoFrHSXz8OEtZRa0LDs8OdBQewYLqzR8ePZzX9lLN5FQ7maxSReerbpg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eGnH8kXM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C164606A329
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 16:14:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C164606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eGnH8kXM
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-55c7445cf85so114831cf.1
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 08:14:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794672879; cv=none;
        d=google.com; s=arc-20260327;
        b=ZMJl5WQLM0pVxPP4MuDkMh34/VEisZiuD327unQzonj2JrZJauiKLiu08fBEA8cetv
         su/G8392Xk9fcA8+A3UqE8HnDA/GDWomYNUF7Z4tOhC3XEYDwGoAqSmgLyhTRtTirERN
         cKSaUxVYlxfldHYeCyU3buDOt5zytT9ShPMXqHnrQmUyqOkwR8uG7TFQl9WAIvLDGQZz
         P676Cf5ym8WGd1rD7tN8CQmD8MLM5jwcxVJhObteDWNKsuvZKSrxxhH7XsqMhJGT7I2f
         UfzcYiyOSA2k4p4VnfsuegHhY2XFnaybyOoEcfEAG7oE9sShhS4QfUo3ZsdgM1mqAUBc
         8tAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j8apjl5nKZpbhUKAqnsuXWh8fD6xWu4DQgoUsG2JJJo=;
        fh=yQ0FGAj5+0o2agVINlm9vulKqwxR/uq0C6bxoEWIYh8=;
        b=aQ1u/6JjhcLlVOFyymd4AOsm7L7BLi1SdpTDFanhh0qz5FshIoUWitSTGnb2FlxW+W
         GjJATUorUC0PHHizN4dVX7gcS25Q57J+TB+fDsayi3NYS0HyKf3k9cPZ1mP3vGer3b6D
         P+FOlUiqBIdV44un+M5k40tQmyK9E46ZIwNPk7d4HgZegLkBSsc5v0n+DZJ7TU+YYJcV
         vFut4ouxg9njcZB/y+4uIPEubf6qLOzB0HRtnaP34l3efeAm0Fzt3U51jxeU3isPiq7R
         GNPG3ydbcaT6RMbk3ht9K67//i2mGgDZj9iEGFkAyVBTYZUg0tgq6Yt7ZjIVmexDZFQO
         PnvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794672879; x=1795277679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j8apjl5nKZpbhUKAqnsuXWh8fD6xWu4DQgoUsG2JJJo=;
        b=eGnH8kXMOYxC2TlWp4DVV3gFXtmUqtPsMEjaeD15pze6UXKcTQk0PVcY2uu88INmhy
         cQUr9WEkFjDQ5HeF4AE6m2Tudp7FCIF5CKTgK1EcnR07aNwNxqADbdO9eCaezTJUgtqm
         Fb4i2HWdBNYqQQumVPu+XIKwapyBXUNPo8zxsuaFeKFnAti+agc5Qgv4TJ++gkYDTzKz
         U5M9p6WJkHeu7Pk89bjg8ZGAsXSj1U6XFwKM9chftOZCCjy4IfUmjXrulYXGqWbbKmaM
         TFYH/pKdO/TMo5YxegGwUcggTRsZZTp2dYhIHBSzWafLSFHWPyyvGygDoSxX4Sbwjx+Z
         B/9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794672879; x=1795277679;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j8apjl5nKZpbhUKAqnsuXWh8fD6xWu4DQgoUsG2JJJo=;
        b=ann0JvOftt4HVcMGYdoPCMdHFd4Qm4qpU2qyOWmqhxuvqhjK6HXEnmtSUFPcW32jVo
         1UbJOdtWnh6gaGcxblLv/wWfIPnCDwKwR2Q2T3Pm5iKcS6YgNA/iVlaZIQxEecN0vE1B
         4K8rz6WnP8Vlf1FaOw3l+NbMaLhGwg71/s1imLz+Mes2hhiMXNo2SSlRWNRYe1SLyNmZ
         GHVkxRqh4j/bB3nLYDHhfkdYUbmNCu/6nCtJly3Cds9D2i1zYipGbY1qDTsUiLHhfi+l
         Uo4jxW5hmpeDCpZEXp/qLttMsNRhoghsxwpVhrjh70kjQWg5a0TPvdICIadafoyc/zz6
         A5sQ==
X-Forwarded-Encrypted: i=1; AL+hErEGwnQhZvEzAPFWLjPik0QBF8rMgDDGnoAX1BARkkRIne5UB6nqzTq5HRe0NaAzkVd+cMxv198=@vger.kernel.org
X-Gm-Message-State: APuU4Z8i/2g7UQp6Az9w0Tgl5AsQlwhE+o6hm9stvWl2j6yEM3l1BJED
	Run50cci75rzgdjtAlwZCtyNCt88HcCaaG8n/kvQ3Kef31WVwcKxPXfgpuCR2hSvde6X7DW7ppp
	fKiQrn+bk6qbFUoIDSfSkWLI/tpHL8L/GAj2LPv/gS7w0jNFqpfl9DMFTdEQ=
X-Gm-Gg: AYBFou1iXQXxCrUAWjWQJa8mnnfQQ+rRjirvP9lUxsJ0qRnNXuTtkiI8SlTr7rzGZyn
	IRQ3Q6R6R3yTs5PbqxyLhLx9Ff8IBb2ZKYSP5XGRMk0i2yh6cug2i2pp5craXA+uxn+pOK0IOs0
	N4BhieVdhHqK2GgGX9YNF39UDUhqbFPZIjMDpLQelQhP4NfWs+B6DCik0gunQ5yKolQ1gwkk4Af
	VcpqCRok11fipMAyTrNJQ6Tk07uAXpw0uGiv4M5dNko2wtOK64qz+Ob52mZr3jjlxcv97xgED+y
	/16O2e/t7JPcaNmVOBue48rconZU1+n/O3a+SfEozFymkfqZ2eFkkVdo52xmsBv0O38jmQFPbjG
	XUy4hk6QLOQdPCc/FZOoeMnmKXoVfzCmdDR4GVV8OAMB0joi1OrF9+Z14lB4qL8NUrx6epRtRuZ
	upeswPa5+4BwYtXUndUegSmhJT3Hw=
X-Received: by 2002:a05:622a:230f:b0:55b:ab4a:6fad with SMTP id
 d75a77b69052e-55c67104981mr13076961cf.9.1794672878652; Sat, 14 Nov 2026
 08:14:38 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-mtu-probing-series-v4-0-6f2e484ca8ea@gmail.com> <20261111-mtu-probing-series-v4-4-6f2e484ca8ea@gmail.com>
In-Reply-To: <20261111-mtu-probing-series-v4-4-6f2e484ca8ea@gmail.com>
From: Neal Cardwell <ncardwell@google.com>
Date: Sat, 14 Nov 2026 11:14:19 -0500
X-Gm-Features: AclHuK9fNu1No-43bBVfzzgRbtaoksUaeXTfvDONR5zNzzDJjI-OMhnJGTsg3KY
Message-ID: <CADVnQykdN2GhRDNsA6yMoMcj4Yig2gYt=i96zfbVOSmP=qb1jA@mail.gmail.com>
Subject: Re: [PATCH net-next v4 4/4] selftests/net: packetdrill: add TCP MTU
 probing test
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
> Packetization layer path MTU discovery (net.ipv4.tcp_mtu_probing=3D2) has
> no selftest coverage.
>
> Add a test for an active connection. Check that it starts at
> tcp_base_mss, that it sends the first probe half way between
> tcp_base_mss and the peer's MSS once cwnd allows it, and that an
> acknowledged probe raises the MSS and leads to a larger probe.
>
> The SYN offers timestamps and the scripted SYN-ACK declines them.
> This also checks that MTU probing uses the negotiated header length
> for the initial send MSS.
>
> Signed-off-by: Yongjian Wang <echoowall@gmail.com>
> ---

Reviewed-by: Neal Cardwell <ncardwell@google.com>

Thanks!
neal
