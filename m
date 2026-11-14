Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794672832;
	b=AzlGxQ8Sk4fFIypHS+Ofbt67ZiFsy5l3YjToUYPwR4Chp6ko6VVtChZQy7U6qpmAkmPk
	 KIRF3PWzqtOVqD++iCkV1qGI3QfpjFFrODKKAIBmh7QQrDKJSoLwijitn5Ql9NlW549Vu
	 WAvwDKTwTGe+KCwHfeQBYN5A88cOTPFw5PVz0NjGRdIfkoWYKWsIFBOm2qzpwXbC3Qczf
	 3GIHH79cC6BDjQUc/eapwqVqwWMAeiYkNMBb64knjPLNIeBbPRoMkI+cKYAOqIRABIU05
	 BSwrDKudbfQNO6zwbaokrUFbmZXTyB9vIuExSbtiDJMvhbmbub7LGDlMjTM6ul9YirQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794672832;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8Tl9o8/ajPwx7BAy1yOh5VYBJUvFApl5E8YYkNIIX5Q=;
	b=2bHqz6kEwv5XugX4hjeGlZs5gy0rhtwgmHu1BTWF6QDmXG5u7nR0bCucsVeLaUiBmS9F
	 hBzYWBYuGJJh022JqdRI0xx5EZ4Ev7vWowGS0nl5pNCFarBAZ7Nl9N9wS4OKsN86qOmzF
	 CNg1UR8W2jYtW20LQcDHBtHGDq/gLl4+2xjo4YbyVqGlyDRAzlZwtxbBJA9xgnq8+4G+J
	 1eVeuxdUe7GgEOxYTW0tVQ2yEDkC35qGdCwpepeNwh7UXTd5bJ1+ttlJtBJpDw9qnK9Ie
	 QyACWA0sdyQoAVzhu8z2g6RvPgR/Du+KpJOqRezJCTMe+3zmYPZAnS+9LrJr7+9Otpw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fWYykvaf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F83606A327
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 16:13:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15F83606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fWYykvaf
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-54492d8a988so108321cf.0
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 08:13:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794672831; cv=none;
        d=google.com; s=arc-20260327;
        b=UZwT5N8sz8PPX4wlFkF8kkHQzDHkCBy5ZGgucX8zuXeARkPXvkh8PFD7etoRgl+AHq
         OorerKQslIFrMTdRmO1Wdo7egZAppKHi+5JK2lmNDcn3HCuVdcVjDVmckVyFg2ruZVEl
         jsmTyeJjEXgFFEw0E0BDFN628eTTW6mW1atYOY0OK3hjl/du74XxYva/J8rybhnLqQ1+
         ypdeTP2rKJCgMDoNrlbytDVtVip5/XGR4MC0iH74ZoQn8vnQqbu6nj9lxAJwH+NGKdFp
         xuuYJVBoyxQtHYDi7NuODlyT6ZYd2TQSb7CTSnPzNdRc4APk5stTBIK/ggdaHUQ47bh/
         7N9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8Tl9o8/ajPwx7BAy1yOh5VYBJUvFApl5E8YYkNIIX5Q=;
        fh=4cJS1LQWxEJgJ77qP4ch6oJlufQk9+yaI7Hw4T/+ZN8=;
        b=MVI3bPOrv3IfAMajDCT4zyEZWxRKD3zYVOhl4+GqzjBfdOoDu5IFYBdpDSGUGJ6+7Q
         aOzy99BO/+6TDL8z+C65P3i9DFoola0w7vKxChaMmsC69h4H0wJs7yUxSFQM9YAucOYh
         21hH0tjpm+Lc1yrv73vqg0ozM8PIzTG2waRlAHwfqVGg1FuqGWJy8lR/cdFbtscd9f7j
         1fD090TCa9vGlGnorY/WjCuA0mculAnWITbsr9rJ3CRdg57Dg9oMbHa9WUZyAa/Z8WbB
         /y8g0VFvSMqobVNERzxgLiftiHf/wZyupFYN3/mBv3pT06B8vCP4B5Cm4nt5iCWjm1ge
         kRmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794672831; x=1795277631; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8Tl9o8/ajPwx7BAy1yOh5VYBJUvFApl5E8YYkNIIX5Q=;
        b=fWYykvafZEoWUCoWkp7dZs1CDSFqWz95hiQCzldSRaPDAmnUc0YgkC/SZtmGv2c30P
         1nDiyPcFjnWek1jFrBaj9qVb8aLW1fzi4iNqW+MTldpKCfvjsv+HGc6ddi9lHpOkz5F/
         UFE1AbyPMHE3tiY8F7wdlXNnOrAzbUcMOYkiGKDtR/qKYz2+fXhSkFdsXCjLntFYfx9Z
         d2EDrsDG7UGMeJvyXA2LEh7hLf0POdeXeWGPUXff3tXibHM1m2KAJo0r8vd10EP5sdb0
         GXc7WopONhL1DFJ9Vm7Pfb6y8jfg93Nmnr4C7x/Cqy0nKyguWvbp7eBJzqROWn1htufV
         pgXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794672831; x=1795277631;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Tl9o8/ajPwx7BAy1yOh5VYBJUvFApl5E8YYkNIIX5Q=;
        b=yv0P4gvAx8lt54MSZ8nEnyxZs+hcqSArKNMmlzfWNqIAKt9yzQa2PWy7740WNTa8c2
         EtDxvg1iIFBjIMeM+P2bL/tuwRP8be9ZvVF6yyjgvVWSGqHojp1ogw67kWvWz+DbCYTt
         8NGdV8+QUAyNhuAOKf8jokCzPp3C1l352lR2RQFCP/QY1DwBIjbrfhDzuHB5S9VaaKzj
         RBTvl0ndsGSfaVJxyEy538trG5wV0YkN59Auj+824wBGV/AFfYGdtMy3QfUd1lBRyT6E
         u7kCqk/3bVKu0/tobi2+ijvOKMiSnDwocmodwaf7su4U4LPwGhPLqsfOSqSwL3/DH54k
         lxFA==
X-Forwarded-Encrypted: i=1; AL+hErE45ab2sJPDAt6DOg7bhM5wMHsEOMH8KQd7fV25jt5OkTlW2CdJ91PFclvMIm/5mYVouA44T24=@vger.kernel.org
X-Gm-Message-State: APuU4Z/U7B2GIPbhJ3U2xmJGhEo/KyC0PmPp0jvGcuEZAwlf6aMmtu0a
	eTHN09l/YmpSBEF9DWgtE1gAWkJ6walx3YY2bsB+BK3Q+T6bcnEdDkUYioQPdeRD2MKrvzCCG4O
	4d4DpehBcEgUu5SVMDJ5pzMfWRbIBjgpR66TfbaEG
X-Gm-Gg: AYBFou3JxcpmQGaOh4uF08DN5SrXKrlcrz16G0Qu9meSN7+pBdzT5XD8NxDPnGvYn3S
	/3FXTQ4aaTQxZPmkMxhCWSwX89m3B1yrm8tvIdOpdgyv4uyWRbJDP+Y86080PBTtebiKdh+jZqn
	WIoFXpuQ0YB/fUPfSvNE6Y6K81yaKf8E5qFWFzsyfHqN140WjhloPbN4ufw4VkBkvwAjhiIhe7t
	eu/UCnoKF13/AZ4dhxVmN+har4trLEce9ZcqJ/Qds/vAkYJhuWciuuJ9O/n9l0wd/tIRmWGG/G5
	qcnxIZCJIb+dVqE5Thl/6rdXFpJPno02fwhd2nhidzj+eeTd1RKlZV8K3cLpsVia2q9M98ciLAV
	iuSdTUzX3VadhxkequpsjKxFHG9BIQFBfNKCBMM07JvmOKV76+OmCURpX7VHKN/FBYZ8yMv552X
	WQcpWiHmOhGMnJ1QpTPmQrWZ4m3bA=
X-Received: by 2002:a05:622a:1f13:b0:536:353e:8d2a with SMTP id
 d75a77b69052e-55c420acbb5mr16418791cf.1.1794672830375; Sat, 14 Nov 2026
 08:13:50 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-mtu-probing-series-v4-0-6f2e484ca8ea@gmail.com> <20261111-mtu-probing-series-v4-3-6f2e484ca8ea@gmail.com>
In-Reply-To: <20261111-mtu-probing-series-v4-3-6f2e484ca8ea@gmail.com>
From: Neal Cardwell <ncardwell@google.com>
Date: Sat, 14 Nov 2026 11:13:32 -0500
X-Gm-Features: AclHuK-5_dHag13CLSttPyHmBa-mJPoWFf4s1lkgb_n0rEIb8AR91foWfJLHYLk
Message-ID: <CADVnQymoQEy_Qg8NciVFBO857-ks7vsBXYeaBGuLQepBkMD=OA@mail.gmail.com>
Subject: Re: [PATCH net-next v4 3/4] selftests/net: packetdrill: add TCP black
 hole detection tests
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
> Black hole detection (net.ipv4.tcp_mtu_probing=3D1) has no selftest
> coverage.
>
> Add a test that only sets tcp_mtu_probing=3D1 on top of the default
> settings. A full-sized segment keeps timing out without any ICMP
> feedback. Check that the MSS drops to tcp_base_mss once tcp_retries1
> is exceeded, and that the smaller MSS is also used for new data after
> the retransmission is acknowledged.
>
> Add a shorter variant with tcp_retries1=3D1 and TLP disabled, so that
> every retransmission comes from the RTO timer, which is what
> tcp_write_timeout() counts.
>
> Signed-off-by: Yongjian Wang <echoowall@gmail.com>
> ---

Reviewed-by: Neal Cardwell <ncardwell@google.com>

Thanks!
neal
