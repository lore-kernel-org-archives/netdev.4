Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795190729;
	b=RbHQjDsDtif2vKvob36tynxo3lhOntqutMm9zBgBSqpHnrbxtxWUzIh/QssCfJgBb/nw
	 QKsf1obdRJiQgbhpxfMB521AyQazWHCA+RgzCRBVqdX0Wsa4VPRPpTCsvV15RoP3MP23o
	 dqQWrmeEFxuHQGIMNCWQXG1CBwwlMkbY93w6xhrcYPI08RzGlaEkKVaYdiRlJ2orbiCDR
	 1xtmM6vzvzJ3h0raFefSdSLnM60pDSZa7OJfCLeIbxP4dT15Wr5mjAoEdcJs92J8Y9Xw3
	 SIlNGoJVYGzd/a9t0puborL+cN2OtlM8aBJuedU8cc+VnYfvt5rd4Vs0VZkJh1WjhlA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190729;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=D5qRI4h4vBd2n5ugHmd5LfCCF82oMGWtSg5RhJQE2Qw=;
	b=l/xBSLAWdj3u+DJYT8MLucH+tjUXUoQ3yP8U1h7Mz3j7y/IRcmusup8B2Qgrb/y1KWW5
	 D5SGFzngDTQyBDN3XYeLXJhdXdt3HMZVFVXjIm1XTRYfPzrfGk/1e5w+bxk1us3fGKyfl
	 C+kFW5V6nFZZtfbkVL4fg+udn0PtNniktHCUu0PLv22A6CTzUKw3a5+WJ/dwLkv1OmLnQ
	 V2VDp0yO6TvG1SEtbP5xuaDnaGa8xdu6ncX5FYuTR/ufVNZjbq3+BPPzNpBLJs3pOGYpC
	 rOr/dKc1BwfU62jcDxc8dmrNcNHOnf7XX6sn/IKlbwiwQDGBZajII2zsqVF9l4zdD4w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=K6Nn0dYI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D14606A32C
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 16:05:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8D14606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=K6Nn0dYI
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b360828905so9195307b3.2
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 08:05:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795190728; cv=none;
        d=google.com; s=arc-20260327;
        b=nkClEJ9N9FUMN2xYVny6z8jEoBEj/CreHWZbIlQDWDlrf2z+GF3lBTVxCnmOq+PbGJ
         Xy506vt0yGxrRsz9SmUnJ/grv4MSJs7acMX5n7sMAIM6FCqEqwmpcL6H/zjiK/pmnTyS
         5sSqbFYC3/n4nTg8ozzhBn4oWIGihnvJUNbcFUNjQvEj9i7E3TD8h8CcJ4JXD9H7O+/h
         p+tebf2jFb5YQCzsB99Jnojv8IP1mxW60edyB3gw8fe5GS86PLJmfaBSLLdZ/5J9dRAx
         KoItaRU7VjAlvmKuwwOf+FxOO4ocBqE6rQbfd4eDZ8Uh4VtxSdefqOtU+FnoxaAbPewP
         l3zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D5qRI4h4vBd2n5ugHmd5LfCCF82oMGWtSg5RhJQE2Qw=;
        fh=rll41j+0/C0sNOooCCV6B716tfHH9WdNI76vysY2SjA=;
        b=N5TJEtMYb2S6Wa6ZK8qaMtu/66tWacqguz/cfi9iRR87VEGkPUkrZjR+KfqKzA6dF0
         J7sdrJ4DUCPlXSytRI0XHHB7YCCzcDHKSf1mZ4SDq4kE7fkp30THnup7j7owFZsFBHYa
         O8jxRiH+hy28MJLnSSc0af3PuLCYdCE0ilnPlPY5VwjEjHCDWMcLFTjLX9I92OoUMxl3
         gPvmPryqx6grHrGnwcbLaCVuTWxIUB1asiJfPBCKw6MS2QjJqVYTADcL2bvY09Mbmx6i
         wGniy2cVNm+UQaP6LI52HJR2MAyEXeFFPPCO0SJw8GJ2Cu7b252suHgVtkObx2cYxeL7
         uo8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1795190728; x=1795795528; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D5qRI4h4vBd2n5ugHmd5LfCCF82oMGWtSg5RhJQE2Qw=;
        b=K6Nn0dYIebQ5u8bEJ1qwH/Xj1OSc/jWHWSxf/kAmX7N/lz6XVvlCxcaj0RLD/vLojt
         7EBsCoFW2xYaaJqwRxsQDtO51IXyz6cV6SWmrutsRBazzRiom8lRBUdiemPWWRgNqVrS
         NCPUrTrjo9bj4jkIGtSTAw3akvQcYdHFPM5BA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795190728; x=1795795528;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D5qRI4h4vBd2n5ugHmd5LfCCF82oMGWtSg5RhJQE2Qw=;
        b=EMAnUUfh0IqgtY4XwJHao+7sJtVc4GYKRzUCdM78mh8GbAJTiIM8DLGPJB2HpVmLD0
         XqTJI/AQAnhYVC6JCR7jXyqywYkyb15BAbL6MvEtpGYgd7cz5iVsmkvi1PbwR3KvOG85
         a/7zzpqiAYxgo8Lw3SrtMQ3lEEj8n/VVU9PMT94geGTrl4tmK4I4DeOchu8Js8fIflhv
         LUw1T9ltoRl0oRosWz0//vv6LkIPkBnMCITuNFRfjSXW7WzshhM5DB29OZo4tgG7iskG
         frsoeAPO0FSgHSCVT4h/AEQz7qFzTScftXM3oXR4FjPOX6tLQ51YUsqYvAjwqLYr4NcF
         CYcg==
X-Gm-Message-State: APuU4Z8nIOy0ax2eu0J7velQIKiuXuytkRGjjBhLMP7uHCV5xF1ac9Qq
	4g5b8ZTgIQ598W3ZjCzbKn+mZ/kL6Qn6sBv8DmZuu2KgC4dW1uFHn+cf8eBiK9p9fhsOxzDSkhl
	4e1cw0a7hQ+BkiWXyOn6l5X4YwrIgT1Vfu3nCJ4RxwOFe0Uitz60=
X-Gm-Gg: AZFdTZeANZvJfzwgBfHH6HBMIza5wNqd5FGcTgxgCv2UvrNV4BJG5Dt8h4MMiOC7SMS
	uOlq4rF6Yk1FElUIvY5fciq9dp1nnXNB4cwFW4/FMSqfYs8mnMZ9HBHkKBDH2ywcNnkv1yZXPS3
	2OEGqnMeuyZsG6fICqKD+E9FMJIyULmEMT7UYH7cRYkoEfRI2U2GgllfvXqJmc7szHJTLAKfN7N
	SrIKzlw71RkyENh0pP9EBjXoL8hohV8cNQrNZqox+RV+Fcm6fJQCgoLe5c6Vhb6cFgO55MWZNqY
	/GiWs8ok8Ek2x61hGGeIVe6PpO46knW6JswHeVZZOR56w6J8pMwIN+kenh3gi0Hsg7LBL3UTowT
	XX9ZnONPjwtt4AxHtRmTKv5vk0ynbne8bwfgB21R795pfAu81pFrmDiePBFQ9UaTdwxZFrvqbZY
	op7EFREMgfjb4umX07SRlg
X-Received: by 2002:a05:690c:4a09:b0:8b4:d1d3:36b1 with SMTP id
 00721157ae682-8b52031c312mr14043177b3.3.1795190727625; Fri, 20 Nov 2026
 08:05:27 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CORE-J9UK.v1.r0.20261120103344@mojatatu.com> <179518966319.3291.5653366565460355407@kernel.org>
In-Reply-To: <179518966319.3291.5653366565460355407@kernel.org>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Fri, 20 Nov 2026 11:05:14 -0500
X-Gm-Features: Aa3M54o0Ta4AC0N37lo8mG_wIU7T1CO3mQnLv3LZLQgqwYQpH6Oxq6D75p0ceNg
Message-ID: <CAM0EoMkqsLHFfthUzA4cD4XLH_bSs6nA+Rf0_4+j7m07wZOu-w@mail.gmail.com>
Subject: Re: [PATCH net-next 0/1] net: neighbour: skip the stale dst lookup
 for a redirected skb
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Jiri Pirko <jiri@resnulli.us>, Victor Nogueira <victor@mojatatu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 10:47=E2=80=AFAM <netdev-bot+sinfo@kernel.org> wrot=
e:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>

It is a followup of the thread listed on the cover letter. The
original thread is derived from a sashiko followup of "pre-existing
bug"

cheers,
jamal

> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
>
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> --
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
