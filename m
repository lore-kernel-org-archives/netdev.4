Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795048215;
	b=QnS0+kJWrGYXfW5ZDFf7ep8TDvtRn8ASzGp00t4CnZLE6NJtWtasJ9+EmC8sMTijSnga
	 hZPK5pfnzhSM6eDseCLvlvSuGjest/eWAM10BUuNnRpGmjmXH5YMJWlhClgA/UR6Bw921
	 ifhbKJwKXaOtIuSI+HRg0CWdhDY7qK8TgeBU/EcFMzZrKal1tnIHwAOvFscf9DfMmjTB4
	 ByYrZ9n5LpqCgLzvradDp43ASU5vcd1JDn3OuzY/rOpeFfu1UHHq527OjcnZ6mI+mAduL
	 CY5huIIYHhlk3K0BmUCx4+Bm+XtkKFmFEwwSyp8mEjAs5+TAaH3wxA97pAM4UE67wlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795048215;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6bMRA063A3AaOLf4nBgKeunZjhvNaz9Ho8DKakkM8c8=;
	b=InWt2B+vSsge4AEtX63tiATDvuoSwExmjfuDKizw6+NLVCoZZQ1T5YGjTM2DL3qtHH/L
	 cXLg6A1OIqIetJ1KvugyQMWyrqw4o7teaaFdz1ZoZHM1GyS54Xx3HxhOb9u0xxp3k0zOA
	 TupjQaLUZs6Jc02KEp2MkvpTLsPH5CgGNy1lr3gx/fJ1uKwVwXD6kE7TaPwgRVtmEICuT
	 D4oNDYs9NL7EgV6tgczbi686Gnh/w1d67pXoFmcemfqq4h6fYpxyXhkYubJb7u8N0MTxq
	 5E4VdaVK5uSGSkyY+aksolURruyN5mhO80qMiIQqAS91+FZv2Wlx1yKrmiZ5ZrFqmEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="UG3Eh/SQ";
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D4860A2609
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 00:30:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65D4860A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UG3Eh/SQ
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b8791443e0so57132a12.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 16:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795048214; x=1795653014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6bMRA063A3AaOLf4nBgKeunZjhvNaz9Ho8DKakkM8c8=;
        b=UG3Eh/SQUGCBKdVHe8THw0oF1joQ0Y2EbkldtFzyon8Ud1qfZ0vF/2rOG1imp6Qfoi
         3nsJXuyQpPY6pzvC1NxI6mC/O/aTjVMnen4tckd1G1//jAAaTMzyh1dg+48lNNgoxZ7m
         rTcMET2GtgASluuAmA24qN0JrCrcQ9A0gVze2pVC3lofr5fe7ha+OqUh/nBnpR1DOvXz
         9nanKjn7kn8z1Z7eFpcAirXsfjLAyftZCmJHa/zHCjnQwfmYBhiCXcj/LPAcuXFA2zx8
         tmXPC6sqQKl6MbKwMOs0bNaWEd5ysoAkI/KUs5I/lgvxDF4bnA2JXCLz3KAaNb36nEvH
         IZIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795048214; x=1795653014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6bMRA063A3AaOLf4nBgKeunZjhvNaz9Ho8DKakkM8c8=;
        b=CFCTWhBK+YIilljSnAyqhyuE9P8HtRKY9zY8NrrJbNwP9jppNUH3M+A49e9//Sdbct
         z5a01uh65Bfv1emGVx/o1sgTG8K0AgRmHmsyK5sGNdfDVNUJfoqCmxCehPE5x1hsnTJI
         +IDeJ2Ir6+Hca0TWBw/tUCxRr4J9tc3dsPgBSPVAgb5MH9rYqJYINf9wkf4maOVGBdBg
         UQLd1Qf9CEmsCCxUeRnht+aV2xP908f1c2p6IcmALt3vMKFwI4bIaE86Mh5VWKsPnbQz
         tUt4xOIm4XdJJ76BWMXd0rIUA0wTAnNa/omzWwSivmmCCirPrkBCXYArPafj4XsEilmN
         Mqmw==
X-Forwarded-Encrypted: i=1; AL+hErG/HnvLKmTdtNSX/jtenoUK83EP2LjJ/hWgFhRq3uaUfRISIWe36hXxHPUtNyXU3+SXjlcKsLA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KsU6Rmb5zfXaYbc5IU+77qi1YmWX+umv/X1wVpM4OKbE8J6x3
	dJRLoqUKH5ym1zbu2KFGJKWg1Ohm/6e4aZePoVUCinJRrLq73Hlf/7bM
X-Gm-Gg: AYBFou1N8UNWc3Jey6rPdOIYOTaRwgmzqzfNesQ2eTbk8P7bDpNEwhwePNQn7aUNZCX
	r84B5Sz01f2Dp074koPaXQN8Xwfu06lZYGBkCfpGbD7NffI3/OpM9X2tDd1JJjrtvY199/Wbee9
	zzL7hUInYuoIBTvwpB1OV7vQvj0rDPFRRmnumy/uD5GMDEb2Dn1BuJFyAvOcSNEMfySRRolKlDE
	jYKyxMWd0RVdLEuSAk/xWyNmoBGzF5i7zBrmdbtOJc+4/zRkgiT9nQtJzFoQkcR7FVRbkp3upAM
	Nq9VWEC6rF5MNY6DBlkUksPTBjLJW7blSi3Q0ENJSKVFnBY9jiI18Lw76XRY/WMshp8H0/YfgYZ
	LURso6Sympub4y2oHCdgNFLHGTCJ1io6yL+vzadef+7eeU2gCH0htksrMg3pHrl2XJ1ip8iIsn/
	Y27Qld5UM2LTCxaOo1nuPGP5I50N0A72DHADQv77jElqLsSqSmaqF817pu2pkd+q9IoaWql9eFE
	0oJrBWTUZ5oADIfJ81zcdvYGXVlce3RwpgAcwXmaEld5NcekGOYh5maxlmhCUAKtNDgunL1RuiP
	H69aglFLUp1s6cww3mPSDZgMsPt7fqa4ykmrEughwtQtQAaoaMVTBA==
X-Received: by 2002:aa7:d152:0:b0:6b8:7d2e:838 with SMTP id 4fb4d7f45d1cf-6b887c69449mr3774897a12.1.1795048213632;
        Wed, 18 Nov 2026 16:30:13 -0800 (PST)
Received: from Nuel20.localdomain ([105.112.208.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b88a001123sm1729744a12.21.2026.11.18.16.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:30:12 -0800 (PST)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: tianyi@cloudflare.com,
	hangbin.liu@linux.dev
Cc: kuba@kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	skhan@linuxfoundation.org,
	Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Subject: [PATCH net v4 0/3] selftests: net: veth: propagate check failures to exit status
Date: Thu, 19 Nov 2026 01:29:59 +0100
Message-ID: <20261119003003.40482-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAG4wq-d_30-B4wQZu48ZQXAORM4QxRqPfmYsmoHS0hiYp1EtTA@mail.gmail.com>
References: <CAG4wq-d_30-B4wQZu48ZQXAORM4QxRqPfmYsmoHS0hiYp1EtTA@mail.gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Four checks in tools/testing/selftests/net/veth.sh report failures
without setting ret, allowing the script to exit 0 even when a check
fails. Set ret=1 in chk_channels() and the three "bad setting"
negative tests identified by Tianyi during review of v2.

Patch 3 fixes the invalid TX channel test, which used nproc + 1
to determine an out-of-range value. However, nproc can be lower
than num_possible_cpus() when CPU affinity or cpusets restrict
a process, meaning the kernel may accept the requested queue count.
This could cause false failures on a correctly functioning
kernel once earlier patches propagated test failures.

Use the kernel-reported max_tx + 1 instead, ensuring the
attempted value always exceeds the device's supported maximum.
Spotted by Sashiko AI review of v2.

Changes v3 -> v4:
- Patch 2: use if/else instead of "&& { ...; } ||" chains, keep
  lines within 80 columns (thanks Tianyi for the review).
- Add patch 3 deriving the invalid tx value from the kernel maximum.

Changes v2 -> v3:
- Add Tianyi Gao's Tested-by to patch 1 (thanks!).
- Add patch 2 fixing the remaining three checks.

Changes v1 -> v2:
- Correct Fixes tag to 1ec2230fc721.

Omokefe Emmanuel Onanaroghene (3):
  selftests: net: veth: propagate channel-check failures to exit status
  selftests: net: veth: propagate bad-settings check failures to exit
    status
  selftests: net: veth: derive invalid-tx test value from kernel max

 tools/testing/selftests/net/veth.sh | 31 +++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

-- 
2.43.0

