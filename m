Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794672779;
	b=v1RuGXkb7VdgQE95ZlfZi5PIF+pihWzJczBEU5AIBuBh8P2/vqV5DWtcPZKKkDnUz4Wg
	 dnI2BdRSkQjfeolsx+EYYaYcpjznFOa2OYeOV7CVq9d4yau+HKT95MTiPLrZQkgdXDXK0
	 UK7yRajW7DngW++wRlKIZX3pmBSFhKbV3VBuZNTWvMRkExPC60ayhpUBHAxhiYDsTrUKc
	 aWvUd6sovML7iHDkjVexTacDKggLAkEPuQIoulW0EaK6Y8VIQ0OmUt2sxg097VUzTqdup
	 UaUlnJSXHILkqpBnaJBB5CrimEygCqHq20XmN26HkMXIk1XalJxqK4ov8t4moFyHUxQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794672779;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ghL9syuCHlYtFbB/1f4OgkDiaorvJ8vhyURwos+Gw5g=;
	b=zvkpwb6AK72F/N+vNgA8ukUIvOXXd2dMY6j/BMBenXrZ1/VxlWYhzTPRNSdv03/10ikR
	 XVSeZZRPYmR4lCPwgaY6SdNTLDpzK84pPRTe/mA5F4AGjf5ziiunuslHel+IQfJD6Gw3b
	 A2bKkOpGxRjQfnF+l1m25CvPwYOobqraqKAqNJMDe1gCz4SqDNSG8+/X+yj+k/jT0oqzP
	 rG3do/zRbAOPjG+ac4hjLh/CrQF1lGpoVnDiVaNokBUaOQMJ8CkCfvWOgwBjPJUOnTdsT
	 7kF7/9IFwKjtCG2P0BPnA14jZtDD5M7mPRlKF3g6LUozF8s7uXA2F1DtGu9JGRUWs/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PPo4LOQr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCAB606A32D
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 16:12:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BCAB606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PPo4LOQr
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-54492d8a988so108271cf.0
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 08:12:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794672778; cv=none;
        d=google.com; s=arc-20260327;
        b=TOFwUOmA7BmBqLDkIixWBYgfYw7dnk7uIPjr7xFbSbpiRKhL11agGSvltKCfaW4Qod
         0sBOM7UTXX5oRAHHSSluzwTNd+E14KsDeILDMbC+7A53A8TwlVBQvNURJcQTN5XuaciJ
         XBXRKYVzVqAomgtUIXB0jpEzkkDOU4L+0fwMecpJbjHn1kFnJE+b4A5XPmyxla6DAgD+
         CZtGJtUqyOp1onPpIpBXJNzfmJzLrRTO/2qZ19VVc90f9E5RrmfBlT4H6oOHEA0/gHyn
         8/tbLQX3OunQSmnJff2+yDQs7cHSkEg4Ek7fJ5cGHYRn1SVNyRD33lqO3lSyq/ZSR7nT
         MkIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ghL9syuCHlYtFbB/1f4OgkDiaorvJ8vhyURwos+Gw5g=;
        fh=qzAb7ZHkkyPZfu3yosSCilst7dves+lLrESdLfu0Yu4=;
        b=pujaTHmOIfw1Mw13s4mrJtucF1ZaK86NIoh/tGMsxFhyl3wuEGtOyhjd81AwftNZMQ
         DnhEOwpaTXu4uXs5QWBaMDocMa7qHaVfPt5hOe3Cbi8nW2Q6g0SlhzIlYgsny8slbHPz
         W7dpc8rFJTsGO6NFMvzrbo3v8zd0m/vKwXygw9kf6yHOwKE4UZGwaGEHBacE7Z4X9soG
         pX8VB1u96suGY6o/JfJLVslWZfB9mXHKdldS7zzuYnEm9u1T7GgV1j2n686T/tooA94Q
         yH2/PokHGAkYMktsNez10sXTTNu44cmz79zUiryl2Tz9IbTwOYsccHScXMbBJcHy7JRG
         RuZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794672778; x=1795277578; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ghL9syuCHlYtFbB/1f4OgkDiaorvJ8vhyURwos+Gw5g=;
        b=PPo4LOQrKH2CZMhlksHE+/7Vjz1wWftJgfIKRBAkgyPYEc65jXFXnbhbOZr5uQ5noH
         EF8vSbpDd+dh1mcPE9e53ws7qqoVAOPrnorDgwuef/KMCysmvNro6xtX4L2nC9AdbKGH
         gl4mPof5lPdvKTin8aE5lXuRNkeG8b2I1PvOpEYnksaS12R07DsXkdwTPbmzW7dlXNWK
         QNXG5bcZyABAcDW7s3EGKeuDB7lFk84XGUsd8zXOg46AgmTqjSu2CIYM4uDUWupAcJpN
         1o1R4qfL0P4F5brOYSPjvO1uwRJto3HFKo+MW7WNk37UUAsTvnGielhU16WHGf4ILl9N
         lyOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794672778; x=1795277578;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ghL9syuCHlYtFbB/1f4OgkDiaorvJ8vhyURwos+Gw5g=;
        b=h1KVeqfX59p+Wl//Rb4EMCxU1R+Ow5y8Y5iU3RMBziSeO1YAuVXFRUe+MM+qyse3Wq
         JN5aq0iS4ch13o+wTEKKT2uQDfgS0WMW956ljAqKwpnD7j6zK3SXmeVyf8bWDSwzE2SA
         Qe1m3VSbGTPXG2gK29irMigq6xS3Egrj1j/mHlo+BUY9dpYcwOFJIMkjL8zPtMWMIJIx
         jl5bt3TCYiOpCgFYISjNrrPne5ZD33Y3mo/gsY+2ATqaQGRTrFDeDFoRr1lhd+tVgl+U
         XObs9W3mQsLCVbZGM9JVzkh2qEnT80pjv49BoIlIqbFCx8Pll7G68DbjKzS8M6/jyMJC
         gNzg==
X-Forwarded-Encrypted: i=1; AL+hErG8UmZDzimDnYmr1BvK+g8OFART1Cl5Q53Oorox4cqjmSIiqXaiWeikfmHOaTTpPLbswRIvkLQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z93iDddGjpbPgJisZaspztVyeWC1nZKFhmSKO4fml1h4yX28jgF
	dfME5EdImu6Gq18p1AJ4CO0HLLOaIPfYc3l2VpD7JhjDLOY3czRGXwppiQAtRPTpPDEcjzUf5Ff
	BAd1oYPQ0H+x+1x2WnE/FBykPtF7VKRfyxa2cr0lG
X-Gm-Gg: AYBFou2mKtmFhLh2OV1eHJpILi/BYlnskIAKrk7QIUx1CucBQozzVc3sjIc0/C1Mjcu
	VJdeSk3CHVP1TYWyF0E8EBLg9N4vR6cMTlEzIXPnoUZRXcWm7CS4h2ELC20PiFoJqB1YjC0aoy4
	HS9QiuN6/Z1NDtj0TA4c+UgNQhgEugOpvaOJuesXj80Luowol3Pj3sIp6Z+fD10dtxLncrRiD13
	u2Z9SWGthQjMi4PoF8rYSI8KS/wA2tVKNCmlzMD3b6hfEAJ47Fx7aN8PBR2WMzDDsQA12RrDleH
	p0et6HTWO+4fh3xAWi0uCx7noXLrWQxuzPGGOtLXFvTBu6vgKfxhwVLKHhALKUb3XPvJ7HfJtQJ
	LwcrMW31sE7LgwmQ749tf7GhNgamshYJkoq6FzXWzmnLzggi8xCMDpbZKhy+DmOSZ8t4y87oYKO
	us2kKslcC2FpQ7JG1NKz4OnaOMXhU=
X-Received: by 2002:a05:622a:5c16:b0:536:3ee4:81cd with SMTP id
 d75a77b69052e-55c45b33181mr14926231cf.4.1794672777383; Sat, 14 Nov 2026
 08:12:57 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-mtu-probing-series-v4-0-6f2e484ca8ea@gmail.com> <20261111-mtu-probing-series-v4-2-6f2e484ca8ea@gmail.com>
In-Reply-To: <20261111-mtu-probing-series-v4-2-6f2e484ca8ea@gmail.com>
From: Neal Cardwell <ncardwell@google.com>
Date: Sat, 14 Nov 2026 11:12:40 -0500
X-Gm-Features: AclHuK9iNgT_YlTCGTFwNYXfeFtk91ZEPupuVOoSktUih4_lAiwcpfhf4SAWccE
Message-ID: <CADVnQyn1n_BQZ_E087pwaa8fjsz1nuB6XSC4QanE5LLgaScq7Q@mail.gmail.com>
Subject: Re: [PATCH net-next v4 2/4] selftests/net: packetdrill: test
 tcp_base_mss on passive connections
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
> Check that a passive connection starts at tcp_base_mss with
> net.ipv4.tcp_mtu_probing=3D2, as an active connection does.
>
> Signed-off-by: Yongjian Wang <echoowall@gmail.com>

Reviewed-by: Neal Cardwell <ncardwell@google.com>

Thanks!
neal
