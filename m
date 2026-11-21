Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795285935;
	b=Czk7I6+wSFe1Wx3+lc2HDnNUHsxoQuGkkHrYRyzA5U6BT9ckdPC4lOPWDCFyUeGtZKP3
	 nqR/y6VrCeT1hHueF2ThPAagW+ANK5WRLcZwFIDBfqnPQtmDQ5E/C9cDCDZYgt3ykmeYv
	 EqQzsbxYBL8ps5b7O7xxKei0iReRdr1Rt75yUgeQLfp+hsKkhrlV1wTpyXTy8WtBmLk5n
	 gGL1KllUXX2VT8M2yoe8Fh3yLKwBgEkQM/16E9EeKx32kmZpbQP5S3RJBflEfMfpq64AI
	 H/qLx77D6KLq3eAoYppu6nE7TpPOoEIr07VCwIdLIyq4UmtIKtUyeQMF3fBQkz/i2Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795285935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=yO3QbsamQWD6lYmcNlTS5aLXfBdJGNAcBuob3Fh76eg=;
	b=p/4TvCvJyIkIzulNukRJAyfmK4GU2mgNb3EUX32h+u37nw3fLSEbENA0i3GY314aV7hb
	 dnTCKcgcf5Ai6NkpyW8nTSmm3TzbKdBUPxClgnr4WJBUmX0qXA1X9cQH7Cg3o6t/eViJ0
	 FWNbeY9Qsa1yGoRF5vdzbfZj+0EbxGdKow9r4Q5sxnyQ0qcKs2Zgyv1Zb6d4kREM3fNGN
	 lJkQlCaNxdTIt7lU4rhwhhI5AYmmzrq3+eyd33+Vlc23tIzXM5gE5tdf9RQuuMiBw7oAE
	 5cK69hMZv+8Hbe9mOVjLvMxwM/hfU597XyLQ16519s5XB9JJIH6raxEdw4/guZ2at8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Daghztvb;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584C4606A32A
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 18:32:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 584C4606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Daghztvb
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-14373747468so1912514c88.1
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 10:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795285934; x=1795890734; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yO3QbsamQWD6lYmcNlTS5aLXfBdJGNAcBuob3Fh76eg=;
        b=DaghztvbDwmLFkrHuo7a/sJTEMIbMPmqTCllt3YXXs5/QvBXSOdXJqhVDvN8JLxAn0
         Vriw8/p4M1Guwy4T73CnQNyFoXuwNeLiyfkeQxsU6imRnXU9tQehTBTNWUntjRpNOnmt
         81VjVdUMTWUnSOsb6oSsyLdzYGp1/peaaANrZO6Z0YHZRiHJmCYVw7lm+R+1lAM23u0B
         2XQ+EBzTODDyCbn7xTfv0qbjMsNI0g0OwlLQ9b6SaiVFY0RhrvKqDHIKkpGzbbRioG7Z
         5TG/C2jVnysrVLiW9jEyHjBQO8xtX71626/ZYM761cudpBrdY6lAEgVsCBaRu6WR/0Or
         mQPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795285934; x=1795890734;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yO3QbsamQWD6lYmcNlTS5aLXfBdJGNAcBuob3Fh76eg=;
        b=Eizfzi/XSonKIOEYcBVl0C9FFhgYhTbMHGfgaceENipVAjT/IixNcD6KX2a1aYPQ88
         AucKCGs3JzkWCQ2Q8mLIb1Zom9RXz9mkuwtHFnu7wBmaicJYGpc7qLV2wesgyYzknUUY
         nc0mnttCWESPQvjCkYp6ioao7ZSdVfGtdn9scNoi0m0YstIAHZAwccBHgpA2Qr30N8Zc
         FDXlP5FbNmAZmttD+BEJCGu70erQXNXAicHS1SNYe7HV3jAmJoPPzReEfQhtZ9A8BrIr
         OmYEPGZ4iDrGqfNpT/QqgBV/BQiXzGfPqsrphmzCuejbXFGG0dELrmOADZzc4EZaR6tt
         /uyw==
X-Forwarded-Encrypted: i=1; AL+hErGKtUkdXk9oI0lYU/U2QrfrVxAcqqFw/Uirkxw6LidmcD2zw4h0YzeJPfKQCbVM2QtNTghi8IU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9W82GIrMAIUi0xu85nHdJm1x4uEpDIvXo+QxFVXTg6xGxDc+9v
	nzo/L8bl3W0WtR+AUMoMMkTmxmBGfDsdaAtPWZkpXOL2OSZv4T7mvOd0fS3u9V6dc3UI80K47wE
	+m0ud6w==
X-Received: from dlbrl27.prod.google.com ([2002:a05:7022:f51b:b0:1b2:375c:827])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:f516:b0:1b5:1a41:f3b6
 with SMTP id a92af1059eb24-1b5567b4783mr5725838c88.4.1795285933762; Sat, 21
 Nov 2026 10:32:13 -0800 (PST)
Date: Sat, 21 Nov 2026 18:32:13 +0000
In-Reply-To: <20261118-tcp-mtu-probing-doc-v1-v2-1-e795f20b8cfe@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261118-tcp-mtu-probing-doc-v1-v2-0-e795f20b8cfe@gmail.com> <20261118-tcp-mtu-probing-doc-v1-v2-1-e795f20b8cfe@gmail.com>
Message-ID: <awHjn5AXWjW2qMPw@google.com>
Subject: Re: [PATCH net-next v2 1/2] tcp: document black hole detection for tcp_mtu_probing
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Yongjian Wang <echoowall@gmail.com>
Cc: corbet@lwn.net, edumazet@kernel.org, davem@davemloft.net, kuba@kernel.org, 
	shuah@kernel.org, pabeni@redhat.com, rdunlap@infradead.org, 
	linux-doc@vger.kernel.org, horms@kernel.org, ncardwell@google.com, 
	skhan@linuxfoundation.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, 18 Nov 2026 16:10:52 +0800, Yongjian Wang wrote:
> ip-sysctl.rst says that tcp_mtu_probing=1 enables MTU probing once an
> ICMP black hole is detected, but not when that happens or what TCP
> does then.
> 
> Describe both, as implemented in tcp_write_timeout() and
> tcp_mtu_probing(). Also add the missing defaults of tcp_mtu_probing
> and tcp_base_mss.
> 
> Signed-off-by: Yongjian Wang <echoowall@gmail.com>
> Reviewed-by: Eric Dumazet <edumazet@kernel.org>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
