Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795511312;
	b=DXbai8OudHUWea1VgBAvwzaEExxxNKpsrXFju0sQdbI4l9kugEJE4GVMW8dEDGsNOqQN
	 CTmqJCe5dn9dYk/kqBKzCLq4WVy+ZEWr12vns+qXT4c9Flv8F/UWKRXGVlSNZsv86OawB
	 wv/2dGQukIf1OzU6jojwoP/ZSQ93//wRoFZEJdlX38gj7bi+ShDooWJ7BmNW7WATypbXe
	 8fyEwgbKsn18nsBq+iIaIKbxN5iFdzss2pZk7hFJmfLPsZKLw+jg+BcIcPE48HYDmRjxp
	 SKVed/0FkU9vsj8NbzbVnkBFxZgbh29CHK5z6p7DioHhZ5O0O1ZROh6z0c2ETAUTqmw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795511312;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZtpqAcH4jNrNmEmDxYS+c3Iqu+GQGbSZvdzySFz9vqk=;
	b=3YD4yG0klA4/ATUYCBzwAA1OAgtj23hp1nPiPr/1fBZ2W1ubVirFuGbLn5IZHBClZvZ6
	 cy3sjyjZAMiZ9yskUFCzePO82su+UI3jBCmq1U1i2mG9dP1U6FtlprrZtEVkloSYhbx2o
	 UI3S21P/CDuuO1dd8OHkK0Ym+gcsj/TupGQteZvm/RG47ggRXzYfuxjxf+LXpFzSAVlQ0
	 N6GoT+ZhndqLIwTACP3W4ohdkZWDClM3hXE2cAdY2jE0Ur6OMU/C7bjVjSG4EsJ33U8WO
	 bXvrjkjWaoWpWRoNdVL5hO8QxGsSPaEc7zb6xVimYOIXGBZARMxVkAL1jlzT7J3J1gA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RJZEb0k2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211A0606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 09:08:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 211A0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RJZEb0k2
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b87408c797so5689085a12.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 01:08:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795511310; cv=none;
        d=google.com; s=arc-20260327;
        b=YUTRvGCAUw9TSgszXaYNr2aLtbBTtYuq6bfqp2cyndlGh6M8tDnU4ZVDkL1Bf9L4no
         6eU1kGuP7GVVgRXYaQFisbQozxKV8hGuilKSAf4IBhZ3H84UrRIAuWPABN//poTVPtSK
         dFPtGRqDMsosFsGYCtqS/iSJT106PLusKzF1OEsdf0wHZgZfcpsJbru+IjlJfEncYzrH
         a5N+pmzJGAoSIme4b0KnXpmjC3J0UHFpD6q+ddzqGF0ADw3nYO167RvYH2XCx08qteT2
         ghGomD1Sqj7SgcpfNWU0HyGyuO7MQ5fZK5JBe3OO2qVfESTgh6tMfA9Iek/iK2kYWo07
         pzig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZtpqAcH4jNrNmEmDxYS+c3Iqu+GQGbSZvdzySFz9vqk=;
        fh=MlKTJqoQZAfg0zADfUA92HSB5O2r2sVGv7pJRH+0nZI=;
        b=aSBqe6dFcK2+JBG+N51nlmE8EUCe53LJg8l5kh/0CYYgQVwgvCGBNYq8epiOCYx79/
         4WZBDjgAG6wgjiJtxuysG7Tl4zh6cx/dD6Lphs7Kw4Um8ZHpwzl9sV6ve2zk38HJR4V+
         yjQ4CaFppOAnvPziyiB+BsYwqHoi77k9a115gPs8lePpNSJEAYah0Jh3335/8A5frq3B
         kxVcokFvEeWKA7ZTt+aw99Wbkh655PMBgYA4+xj9qh9GGZhoNnS1GEt0sgoD1RSVkfTH
         eammEEssezIrTyeEOyKGXXFkpy0TzXNa49HSmGodjlyR2QQfurYVYaRb6v4MIjwLnyhc
         Jo2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795511310; x=1796116110; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZtpqAcH4jNrNmEmDxYS+c3Iqu+GQGbSZvdzySFz9vqk=;
        b=RJZEb0k2qFLF6WVA3OVIdGzyamTTFMrlsqq1scT+R4KPu0S3U5eDC0nw1aLRK5G852
         pseQgOXDaUE5lXJNjCzuASxPlgBcmUnDGCKkWD9mPwDH1CMBgR+nzFsfmm/wSO9m060W
         ejsWCPHdJe+vhHY+Rw5FVcMl+KZRvmuP/9kwsJp6THnbiooCiqStTodBzuA1U4r0D26P
         ufu4Q/5xgnObvIFeByB4ZyylHp5GVjTAL0YB8kuhHZGxoM6nNPNSicV6AaB+5kqjn58V
         xXf6wnQTDLj/+D1+grflBHWpLpstrvyPgE4UA9zUFf0H++2wdryeDXwXa+06MXbe7xJ7
         wZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795511310; x=1796116110;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZtpqAcH4jNrNmEmDxYS+c3Iqu+GQGbSZvdzySFz9vqk=;
        b=GtjjfKMPTyXfER3RXEf9Nd77W11ZOHxGwqqxAjzKF6i3Ay0OJICcdPJE7CFuhIP64e
         egqEE4GlPlTEbBYbe96LLMsAdGlxq+mOH3BZAvMUEVB71eRGcYHw8HZSTBstJsK428z/
         qmo1cIcsx3MmqIi4ckcQ+qLTtBwSjdIa5X/VRbhzTBelchnFqtY93G6kgCnLd4cK7ZGT
         myT42r3IhJ9+V/X8H5i9MHd7uOEklSVr8s0P2DfE4mWAG2vqqF0xdwon++SmjDuPREYE
         FxiOyAevo3DE4LECP/jDVYI8GImv7BGXATUdodoo43+CbffL1cAem4GeqiDtXcvCZNR+
         8avA==
X-Forwarded-Encrypted: i=1; AL+hErEmhlJ3RIkTmBbh7h2dSZCoTiUQ9/IuCXcLlxw2T9oFBikVaeOkJSzdBl4d7RPenZjmAFModtg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8aTgxTi6cGo9Do1q5bmP0/VqB1/7LYxTbYLwS84tSDTh87evlA
	+4nmqjPnHxgSMQ4tBQlEBJo1HjlYbSe2IkBZjW1Qrra+sKoqXdEveL2IWEV1C3wo+FNQcUv1EJZ
	c+QwB0w8NtEuNvqil/HCI9S1uhDJEhxc=
X-Gm-Gg: AZFdTZcm9ZqWKvNvR5IlmV9SBgrZY28TQCiUddR9t7wcEjq1CLByVHDI3ywuK5rditP
	tuqIdRTWxE++4K9NeoxhqsixJ1bXl5HiQ2tgwyoUKlbWFG3CXu36iZD9Xtkm56hdRkAQHulAtcA
	L6jB1t22au47H1nOA+mG3FLhlP9MHIWTN3g3OKp97UHwWfgG6KbuiCfdoL2eEPTUSj6iuP5hs5O
	INnwIC2921DnL1HKo6d9+nnVNyKSoxF70IMg2Ly/c176tKMIsTbAIGl6tIPb7gRpkyOU6bY/sUv
	jkZ4AnompI1bvETuc1MKIzO+LOgBoHlup36yB6J9gv4nLf/clS+AFv7m1mTljVvgCNZqY43xVX+
	oalVKnQKhbDYb7Zgb8wyMjcamSATBr2pnlANafbkEdGyJ/vV0l3Z1ulMnVAajrUk1S7NPKw==
X-Received: by 2002:a05:6402:42c8:b0:6ba:9dae:f0aa with SMTP id
 4fb4d7f45d1cf-6ba9daef192mr4933101a12.45.1795511310178; Tue, 24 Nov 2026
 01:08:30 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118041238.14396-1-evostrov@amazon.com> <CAHfVqdVw9OQ4OPmpLp4pJQhFw_9E7SLwNDjYXYuuGkU95=gGdg@mail.gmail.com>
 <20261123181346.383390ae@kernel.org>
In-Reply-To: <20261123181346.383390ae@kernel.org>
From: saeed bishara <saeed.bishara.os@gmail.com>
Date: Tue, 24 Nov 2026 11:08:19 +0200
X-Gm-Features: Aa3M54pGZJfH1mZu3NDgkPTKfl4Vj5dSI8aEU4mnk4nYNJ-7xyhF6_Xqo3R-jg4
Message-ID: <CAHfVqdVkTOYR_1So9S4pQj+xvvpoJG+qFY0zW6eOFuUzxBiigQ@mail.gmail.com>
Subject: Re: [RFC] net: ena: use tx-push-buf-len while tx-push is off
To: Jakub Kicinski <kuba@kernel.org>
Cc: evostrov@amazon.com, netdev@vger.kernel.org, 
	David Arinzon <darinzon@amazon.com>, Shay Agroskin <shayagr@amazon.com>, 
	Arthur Kiyanovski <akiyano@amazon.com>, Gal Pressman <gal@nvidia.com>, 
	Michal Kubiak <michal.kubiak@intel.com>, Paolo Abeni <pabeni@redhat.com>, 
	Eric Dumazet <edumazet@google.com>, Kuniyuki Iwashima <kuniyu@amazon.com>, 
	Shai Brandes <shaibran@amazon.com>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 4:13=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Sun, 22 Nov 2026 10:32:31 +0200 saeed bishara wrote:
> > > - We still need to tell the device how many header bytes to pull.
> > Just to be clear, the device eventually will read (pull) the entire pac=
ket
> > I think  tx-push-buf-len should have been called tx-inline-header-len,
> > as this is about how many bytes of the packet's header get written by
> > the driver into the Tx ring descriptor.
> > IMHO, we better introduce a new parameter, that is agnostic to
> > push/pull mode, we can choose to deprecate the current one in the long
> > term.
>
> Agreed on new param, not sure about "agnostic to config mode".
> Or if we can deprecate the old one since its uAPI.
I mean the new param will be served whenever the driver inlines/copies
the packet header into the ring of descriptors, regardless to where
the ring is located (host or device)

>
> The driver can store both values in one tho, effectively forcing
> them to be in sync.
>
> All the new one tx-hdr-depth ? max-hdr-len would be more logical
> but we use "max" to indicate the max value for a param.
yeah, max doesn't work well here as the driver inlines this fixed
number of bytes, even when the packet is shorter, the driver pads with
zeros.
I think the name should highlight the "inline" attribute is it's a key one.
>
