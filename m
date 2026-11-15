Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794728759;
	b=Lvv78/3fuFAh/oBCVZJv9zJNu4cLiKT18VZ8WGCVnT7oY41YUPYgjw4XrIlnq2ZbuOIR
	 eyxPBOS3eZ1WihYdQJoJCZ1BmibaDIGoUiTUcxivwIivJUM8yFqLBmpZe6XL5oHFFGPQE
	 LSkGHPwyk/kvf461IuWDBV80L5Z+iBlGnke7ESLLmY4xvSun7M3gyFV7OPJF8ij1WI3Wq
	 PTF9Y7gDQ+NP+BGyjYK629TAX9awN5FZNfWuwq5cPs2sHYHI/cd3J71CiKlxERw03b8c5
	 om3OE/0LImETuTSMppTnED8tG5jn7efEA+KZs+pw71sZY3nLm8V0owusJRdcCz/li3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794728759;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=hYupZFd/F9+mlQ1Qe2cKOU85Z2FtPg/44Q8malAX03k=;
	b=WYepJ6Y+D0U5qYfJhXFvUDhfiHFThcP8pP1IGUaZw/vN2igmJSbcVPRGcJEGaBPoPx00
	 1QyOuizin2FliO3Zwf1aKrDhClDhL6M05zhYzalSnDMiXZnfsvCKT51C2gph8Wm74cqWC
	 FF5Ot+QfnZ+GoFVMIDfIImLt/+qYUMZjVmKNnxWe7trsLOkz3Dz1yLfrBVv7akmHgIG9Q
	 Y0M9k3RznzRqhLvWEPxPC6zZd/ENp5C4wL/HXOsoUbzCuxQhh/UgxVwgf3NhC5fhm+bp8
	 x+ZhCtovuqsojHC7sJIJ0EqPMm9tqnq4WO93pY7Hyi2S4+oqq7P9aGR128otJcq+irg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D1AQTdnp;
	arc=none smtp.remote-ip=209.85.160.50
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58ABA606A332
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 07:45:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58ABA606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D1AQTdnp
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-499f20c7054so1756503fac.0
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 23:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794728758; x=1795333558; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hYupZFd/F9+mlQ1Qe2cKOU85Z2FtPg/44Q8malAX03k=;
        b=D1AQTdnp4gx0VEp+HTMg/wHHUTiAlE4Ye0eF3VbKl6CljIPmbvtU+mebSHz2m37V1t
         bWiZARGqGRLxOPA1akRetRKH04YSCRMOBbYXjKEa1A5rPjSphL5MZzw5RABQ60WAjiID
         qFfKGxbPeeAMWLvHE+vmw1+dx/lK3FI/3u3GHEYJQ/P+UUoIUn/ssR/lwtDL5ngvxlcU
         8T56pCxrweujiwTwBAcAWRePgO3eEZ5kEnkZLtL/yBdNixYmOvdA6kOjA+JaIBNnRDhC
         e65BrgUSw6VdqDCn0sKHPfoOsOrIuwLvKKQL/iLses8XFZdbHG+aBG8yLJF0brkaWEw8
         HG4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794728758; x=1795333558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hYupZFd/F9+mlQ1Qe2cKOU85Z2FtPg/44Q8malAX03k=;
        b=vCEg35HrH4RkDX/CKG9FRCwpMnUyALV+qAhBQKSh7x/+g3tHUwb9HW1j5OcAbJB3J6
         R5FrdarFGtt3BbztCcGhnk5RWpx/Z1f197ct5X+dkaUH27IpP1Ia/Cqh8+j6vrrGymdY
         6fbzYzTYOP88q0X/kkSoY7vFhButXfrFGaMvudsdn7JqqsGPvjXP6lOHMp1opOXvEmlG
         D44/97rtsz0SPpG57e3O2F2DVuEne7Cldjz5z86QW2kpfumx1QCaQ83Un6L6RU4uwZWJ
         yqmZEDlpXXW72wwHeLqsh4AFuwfmS45GPFuMJ/T11avGzzKlVIHIp1+jdtCJY8zihdLZ
         a7wg==
X-Forwarded-Encrypted: i=1; AL+hErFYDAghKRvxu/m7cqyR5iUQ49B9rmnQAblXsOYjgh2S2zFuNlf4Xu4Z09NdzVZJcfleFrBQ3Pc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/F8Ym9ViLaMrkAL9gF2QME6c70OVv7ioruk2QJ+sJgdFUgPKOS
	FlI33Dtj46w1i2L1ys3qf4Z6WIZbFrh1akl0g8Cuw64LsCySI4y92eLA
X-Gm-Gg: AYBFou3jbp0Xz6ypi+jaeCFjorNv2mPy0YtKyPwfjf2UfyKV9XyxLBs7FcgkvYJHHLf
	I/arCFY3noR7SpCVRdCw6tu3x5TMdjxqhzVEvvzrWUe7Ps06/pdTkJsPvm4hvpa46R0RupZlKr1
	skPhuYDYCznf4A+BLiry/OU6lxNfFRjmh4QoYnSY537cjog8T1DbzeeKQuCrfj5vriWzR3nnGdx
	oldjVMjwDLbIsGUje3IA+UGkuZPtLryFf8gZ/P7uX5HE0PuDupoAMdqXMJIuUQjk/JWzbf8YV9z
	gyLoNAlJYg31/rvma5SwEt837afTK0jQB9IaSmhIgyQMa+qYjByE1KIzpiEfLTXH51dZv+HI+EN
	aHksE69lhV9r/ltosGofX8VKea6/A58g9odd282wNw8CHaQQN2vI5qnbI8pfkG9liwVbiv2xLxu
	z0z1QZPLC9zCoz7dB5KTK9q5yP2+g1oIs/cUyz3GRkR2290Kv5Lljs940R2W7YRuosXR5KyExNG
	AUSR6IJnXTUjdGC+dAx09pWl+eImyZeJann5oWcY43pi8810wnQxy04cGUGqnbSNys1NYB0guOk
	k0O59NByhLOkVpGisPE+7momYMKZq9HMqSINpqmrqjfLLXRzcMCuQojS+9Q8K0022bSPUrWomoH
	3+wSXdN+FJ/4qb7ah2QsoOuEfwsXwwK+2GXaONmX8Y92Eg5V8G0Vz2CNxRcDpLFPCcrzsD13NLD
	6M8YvRMgQyu/MMMdzk0LbXz24ThIzu/JdIIYXr+ZuOlQkvxsdMzmo=
X-Received: by 2002:a05:6871:88c:b0:494:116a:b0f1 with SMTP id 586e51a60fabf-4afdf28de45mr6492889fac.21.1794728758319;
        Sat, 14 Nov 2026 23:45:58 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe233371fsm4831390fac.16.2026.11.14.23.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:45:57 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 00:45:45 -0700
Subject: [PATCH net-next v5 1/3] docs: networking: correct the PHY
 statistics group name
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261115-submit-acx00-phy-stats-v1-v5-1-ed81a7f54373@gmail.com>
References: <20261115-submit-acx00-phy-stats-v1-v5-0-ed81a7f54373@gmail.com>
In-Reply-To: <20261115-submit-acx00-phy-stats-v1-v5-0-ed81a7f54373@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2

The ETHTOOL_STATS_PHY group is exported as phydev by stats_std_names[],
but the ethtool netlink documentation lists it as phy. Use the exported
name so the documented group matches the statistics string set returned
to userspace.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 Documentation/networking/ethtool-netlink.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/networking/ethtool-netlink.rst b/Documentation/networking/ethtool-netlink.rst
index eba226c79ec3..8659761ebc69 100644
--- a/Documentation/networking/ethtool-netlink.rst
+++ b/Documentation/networking/ethtool-netlink.rst
@@ -1665,7 +1665,7 @@ the ``ETHTOOL_A_STATS_GROUPS`` bitset. Currently defined values are:
  ETHTOOL_STATS_ETH_PHY  eth-phy  Basic IEEE 802.3 PHY statistics (30.3.2.1.*)
  ETHTOOL_STATS_ETH_CTRL eth-ctrl Basic IEEE 802.3 MAC Ctrl statistics (30.3.3.*)
  ETHTOOL_STATS_RMON     rmon     RMON (RFC 2819) statistics
- ETHTOOL_STATS_PHY      phy      Additional PHY statistics, not defined by IEEE
+ ETHTOOL_STATS_PHY      phydev   Additional PHY statistics, not defined by IEEE
  ====================== ======== ===============================================
 
 Each group should have a corresponding ``ETHTOOL_A_STATS_GRP`` in the reply.

-- 
2.53.0

