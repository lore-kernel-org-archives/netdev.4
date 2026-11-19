Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795124437;
	b=mfp8WxA8f/whYyx9qElKIJVDOAmUo7W0mlZ/ggkGWWWZtK/qiA+ESCpJZubQBf0NGnKi
	 UMJMbf0Pp4sv7+qHsmgwB3YhzYXiVKLhF2T0oPLjbTP6PLcVnNkeZS+zQFjZt0O7rSK8X
	 pIdnlQCZpAZmvRoNrjN9UEr1qzcOif12q2+m9jKX4gYmi1YjBz/06wDAEtDamANScPsif
	 Z1i2Ak84zU/h4vgsH7jXiETPEj2g7L2KoqG5iR7Qg/vDEdUgEy1bcyEKZVAS+EYLkFEiz
	 lUOZaYhQil1P6xstvUOelwbrxR2GBVscSXe6ZHKEg6BrbtEVjG7fLKp/KK9pFKQ7Bqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795124437;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=4e/orZcwN4ehEBe5iuQi3ZYyUYANhKYXfnH4tTDCJYY=;
	b=ypxmctoRZkFuWK4PglKQyFag0Aho2nZ1xlIKmFDrGPzK31S4kWw20ZWQxQATiu7irrpD
	 Blh0jP5ik5ErO5wbX2ekPFQcVIn0EN+sA1o8ssSp+8E9rJADp0H8meatBqZk8gbeK/a2/
	 bgzzftISzFAudcwdIvvbNDRwIm14+oHqnQaTr8bbiJsDmquWnkoTDCsLiiURq1n3FUfBL
	 3js2vnhRNtDyormDCY5AiG8WCSfGxvU64SSydihqwLiM1735U9UGyTxka4Ykq5FnncWV0
	 xMlVgyjt8lwqCruee1TyLPJt9P24UYwZKAiuBoYwVT/VFEi4/Vh9Ra5UDEBnUCJvHtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KmPOrhDQ;
	arc=none smtp.remote-ip=209.85.222.172
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF96B606A334
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 21:40:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF96B606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KmPOrhDQ
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-949664ee41cso28761985a.3
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 13:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795124436; x=1795729236; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4e/orZcwN4ehEBe5iuQi3ZYyUYANhKYXfnH4tTDCJYY=;
        b=KmPOrhDQ6Lw4s+NrReazzyihUq8KfNjnn9XwodUbB+B5p7OD24gq4mRolS8MDKeXkU
         E3lNoiGav+nKXAY9lEqYoRVO3l09upGuiK8V9EmFsJxflDxAfZdn36RLMs9TqjmSVegx
         ObD++d/HteAD8lSw0DczdlWsMpbs8JRJtNtlcxtn4QhCg+i5B7mOyni7z+p658i1GzjX
         sB19dVyqm30sEiCLJqoBrCiaaTdYTVXnnhq7TiETzvj+BjBN2VgZN3szvW6uXm+IyaLf
         XLGTLXOTt0v8fT7E4AFy7cfYSYgipVvBrd7RhYnMNwjRkPD+OZhjNGeVLwoyc2+4Uddv
         EQew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795124436; x=1795729236;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4e/orZcwN4ehEBe5iuQi3ZYyUYANhKYXfnH4tTDCJYY=;
        b=RFyn8JPXn8YDlZB8K92TugUG8aS3TgX8RKR+BlHUpBGTMiZLymYSYVmR/PVl023Q7W
         q9uJYw2P9NDDYdY56V2G3DQshtVLwiAQKiJPo+GOlNcWhgapa9Ri5UkZoHabt5VEltaC
         9C1rWm7GgJ+rApCtd5jbT3M+d0c7WqRQyAS9E7YjBGYPL5kutA8G3bp9SG8f9uoCsxWT
         1P8ZYiQ1RC7gH6Ki136Wf+m2SVyRbNs2TKwO/PXTaxJgK0PatT6H9fOYsLGcEh1lPLhb
         QIwvEm7SS1PMFSOw1hgsp39zvjTaWVG6jqTC0jfDWH2knLYFMzC7RT2YUGZF+ne3vQK+
         kUdA==
X-Gm-Message-State: APuU4Z/aQSb8R0bQ1JZR5glTnOnjqz2/N3Jppf84/Fo05pH78Ieq9QzN
	j6sJH7ICDzzOymDam2O6mcZJM3FUtha7JAqJ8hE+IQ+qPocf8s9yMGne
X-Gm-Gg: AYBFou3Oq8JSgpCQ7lyjYP9PDGYRZ2dSD2+BjOZ3xG7VU449uTv3SjJmxQGVUFyXUcV
	hPD2G34NVqTKmIaID8AwYpgwme7xAJ8TDMhDAU381R22ohgW8sZvJelPyuehMUIJsSVGS2jwQP7
	ScjfuxmK7hcuxE3wst0IbF8CorpOFOe50Slsx/cv5Z2PeFVQGWgxlWTwuzgBUi3lQggdCN0urzS
	Wdam9QuaXQCLLVpasKu2Q4SoZbIQFGEEjIqo2D5/aYc9iNOfdYtyulWM/Lu25O7jihDretXiuuC
	UbPFMBJbMTRz6iQ/bma6V264WucNihQaDIq5D7GUJ6/7cuFcajCjk2FeGSTCYVJrVM+bLOzDEd5
	JOLoxcTO7fNgrjhWQLEwyp8zuMx+4ZEHNYyglGKgfLM3X43Jy2uxsekbLIvBsvW80zeY/yAY69a
	1bcKwrmx+JXgG3sp+NMGr+58qjAEitDaYfdKvZKpFDzb8u35Aj5dvNPFjtn5cpUl2reTqAlHFIh
	jMdhCALfoW6XxuWLN7HxKbIUlk4CtObNxT+Bqw4xxWyX6fVj765EeuXWQT7JSr/h3CWuHKUplpW
	xBLVWk3F+lLXvMuWq1bZ7btc50XpVlYBDCNNIu7mL1niY0o2m4ddpXUfj4W3HhPkzB9xwxm5cvg
	2K/h2r2VIIpM+5eFHvS5AP9Y4mc98FpNmn/JnmIprc72aCt/KOMeKiJacZ0+KI70=
X-Received: by 2002:a05:620a:4591:b0:93e:5060:f929 with SMTP id af79cd13be357-949ba9b64d9mr171849385a.19.1795124435809;
        Thu, 19 Nov 2026 13:40:35 -0800 (PST)
Received: from gmail.com (15.60.86.34.bc.googleusercontent.com. [34.86.60.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3f2de5sm52119585a.29.2026.11.19.13.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 13:40:35 -0800 (PST)
Date: Thu, 19 Nov 2026 16:40:35 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, 
 davem@davemloft.net
Cc: netdev@vger.kernel.org, 
 edumazet@google.com, 
 pabeni@redhat.com, 
 andrew+netdev@lunn.ch, 
 horms@kernel.org, 
 michael.chan@broadcom.com, 
 manishc@marvell.com, 
 joshwash@google.com, 
 hramamurthy@google.com, 
 tariqt@nvidia.com, 
 saeedm@nvidia.com, 
 daniel@iogearbox.net, 
 hawk@kernel.org, 
 sdf@fomichev.me, 
 willemb@google.com, 
 przemyslaw.kitszel@intel.com, 
 bpf@vger.kernel.org, 
 Jakub Kicinski <kuba@kernel.org>
Message-ID: <willemdebruijn.kernel.66eaabdbc8a1@gmail.com>
In-Reply-To: <20261118232315.3593731-3-kuba@kernel.org>
References: <20261118232315.3593731-1-kuba@kernel.org>
 <20261118232315.3593731-3-kuba@kernel.org>
Subject: Re: [PATCH net-next 2/8] selftests: drv-net: drop the generic XDP
 hack from the HW GRO setup
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Jakub Kicinski wrote:
> The HW GRO tests want SW GRO out of the way so that what they observe
> can only have come from the device. On drivers which keyed HW GRO off
> NETIF_F_GRO that was not expressible with ethtool alone, so the setup
> fell back to attaching a generic XDP program, which suppresses SW GRO
> as a side effect.
> 
> Those drivers no longer tie the two features together, so ask for the
> feature combination directly.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
>  .../testing/selftests/drivers/net/gro_lib.py  | 21 +------------------
>  .../selftests/drivers/net/hw/gro_stats.py     | 18 ----------------
>  2 files changed, 1 insertion(+), 38 deletions(-)
> 
> diff --git a/tools/testing/selftests/drivers/net/gro_lib.py b/tools/testing/selftests/drivers/net/gro_lib.py
> index 875a715b2ae1..6eff19db3541 100644
> --- a/tools/testing/selftests/drivers/net/gro_lib.py
> +++ b/tools/testing/selftests/drivers/net/gro_lib.py
> @@ -263,26 +263,7 @@ def _run_gro_bin(cfg, test_name, protocol=None, num_flows=None,
>          set_ethtool_feat(cfg.ifname, cfg.feat,
>                           {"generic-receive-offload": False,
>                            "rx-gro-hw": True,
> -                          "large-receive-offload": False},
> -                          check=False)
> -
> -        # Some NICs treat HW GRO as a GRO sub-feature so disabling GRO
> -        # will also clear HW GRO. Use a hack of installing XDP generic
> -        # to skip SW GRO, even when enabled.
> -        feat = ethtool(f"-k {cfg.ifname}", json=True)[0]
> -        if not feat["rx-gro-hw"]["active"]:
> -            ksft_pr("Driver clears HW GRO and SW GRO is cleared, using generic XDP workaround")
> -            prog = cfg.net_lib_dir / "xdp_dummy.bpf.o"
> -            ip(f"link set dev {cfg.ifname} xdpgeneric obj {prog} sec xdp")
> -            defer(ip, f"link set dev {cfg.ifname} xdpgeneric off")
> -
> -            # Attaching XDP may change features, fetch the latest state
> -            feat = ethtool(f"-k {cfg.ifname}", json=True)[0]
> -
> -            set_ethtool_feat(cfg.ifname, feat,
> -                             {"generic-receive-offload": True,
> -                              "rx-gro-hw": True,
> -                              "large-receive-offload": False})
> +                          "large-receive-offload": False})
>      elif mode == "lro":
>          # netdevsim advertises LRO for feature inheritance testing with
>          # bonding/team tests but it doesn't actually perform the offload
> diff --git a/tools/testing/selftests/drivers/net/hw/gro_stats.py b/tools/testing/selftests/drivers/net/hw/gro_stats.py
> index 70e76e3888bd..569ca81368e6 100755
> --- a/tools/testing/selftests/drivers/net/hw/gro_stats.py
> +++ b/tools/testing/selftests/drivers/net/hw/gro_stats.py
> @@ -173,24 +173,6 @@ def _run_gro_test(cfg, test_name, num_flows=None, ignore_fail=False,
>                         "rx-gro-hw": True,
>                         "large-receive-offload": False})
>  
> -    # Some NICs treat HW GRO as a GRO sub-feature so disabling GRO
> -    # will also clear HW GRO. Use a hack of installing XDP generic
> -    # to skip SW GRO, even when enabled.
> -    feat = ethtool(f"-k {cfg.ifname}", json=True)[0]
> -    if not feat["rx-gro-hw"]["active"]:
> -        ksft_pr("Driver clears HW GRO when SW GRO is cleared, using generic XDP workaround")
> -        prog = cfg.net_lib_dir / "xdp_dummy.bpf.o"
> -        ip(f"link set dev {cfg.ifname} xdpgeneric obj {prog} sec xdp")
> -        defer(ip, f"link set dev {cfg.ifname} xdpgeneric off")
> -
> -        # Attaching XDP may change features, fetch the latest state
> -        feat = ethtool(f"-k {cfg.ifname}", json=True)[0]
> -
> -        _set_ethtool_feat(cfg, feat,
> -                          {"generic-receive-offload": True,
> -                           "rx-gro-hw": True,
> -                           "large-receive-offload": False})
> -

Not sure how likely these driver edge cases would be to reach, but FYI:

    gro_stats.py uses its own _set_ethtool_feat(), which, unlike the shared
    set_ethtool_feat() in lib/py/feat.py, never reads the features back
    after `ethtool -K`. This removed `if not feat["rx-gro-hw"]["active"]`
    was the only check that HW GRO actually turned on. Drivers still drop
    GRO_HW in ndo_fix_features for reasons unrelated to SW GRO:
      - qede with MTU > PAGE_SIZE;
      - bnx2x when the MTU doesn't allow GRO;
      - bnxt with BNXT_FLAG_NO_AGG_RINGS;
      - mlx5 with legacy RQ or CQE compression;
      - and, after 3/8, any attached XDP program.
    In those cases the test now runs with both SW and HW GRO off and fails
    later in _check_gro_stats() with a confusing count mismatch, instead of
    skipping. gro_lib.py got that check by dropping check=False, so the two
    tests now behave differently. Either switch _setup_hw_gro() to the
    shared set_ethtool_feat() (and delete the local copy), or keep a short
    read-back
>  
>  def _check_gro_stats(cfg, test_queue, stats_before,
>                       expect_rx, expect_gro, expect_wire):
> -- 
> 2.56.1
> 


