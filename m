Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795336364;
	b=V6fkEDfg869e2TbyMTH78ZykuUYiEVszbia9MmtuoxAzuPNNnOs22m+b0FRyTIUNZ+T6
	 zi9WxeP/kGg96S/ppM2EW2lphyd9zilg3eR26u8xVlDlfGxbHYyTOe+6OX/NmQsWVpqyB
	 RS5dFi/tjgfg4L+HcNwHkKUKCQjwZ2G1ICiaxfMWTx8O1TUevjfsuqpZrV+ggJhS7Mmf0
	 9XLBX0U78sY3Wh6jar0pio9yc+A1T7f8im9rGcnw5lo5LYOYlux+3GQZFT3aBPAKT4cpX
	 OB8gInamqLXQl3ehZtUIEXwTI5hRWErZ19zv+xZhsh0czXCaZZcrgm2+fHQWari7e4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795336364;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=yJ6P/F1jFJr0lVYrdtAG0eMDCHBsrJpW/xU1AvPrpGs=;
	b=WdJZxyhNYK2YZjsTTv+871gxlRog9cnRfYmQoY4HCcwZQtGPX2KY1QjueSPosgUTD2PE
	 dPrYnruehOyQ5FIrv4nFiQaiAJdwoTAkeBr8lyiunvrN8ZY3sg4B4Abo6TdmL94RaW3j1
	 W8GOPgYH5h04mQJoMyZpC02Lv5JtIU+t1CtVKo1j/k4r8GFYMVxy80IKkLX6JHA6ASAoO
	 a2+mbndHrcG1L4baYmklgKdYL9w+r5SRLmNW9KZzeJaKd2PuG0Z5Guh2saflmqCECWDct
	 ZcIXkq8QpLXbCUllxMkBewhgjYXWV4XFsbCNTrg5pbiU696G5+XZ3nNWRJnap/HwrLA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XB7NeBRY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78400606A320
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 08:32:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78400606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XB7NeBRY
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6bab10842f8so11171a12.0
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 00:32:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795336363; cv=none;
        d=google.com; s=arc-20260327;
        b=Hynzeu0YuWIOZSLxOPFoUW+4ItIw2/py+SYNGbYbf9QZDGSrtg/INtbTK7tlEEvVx0
         b76A6n5RZ9FjpCRCDH8/NOw9sCUwLCgG71lYcjgRDYxomgG+RKVd0qd8aUmeX4NbFsyz
         rXtdGu9+IiPWOm9oXUr8JF/zmJrxbWl7PMhCyxG6RIZ27k+S+HRQBefO1iyiUvByiwPi
         goZXSmERTWM7iYL5hy+KYuuVojp6VO1fyu7zsGD4ccAUucxy51s4WMvMHK8QcKVDkjqO
         MfsjZPCAhKKk+j2VB2b8s+NS0++bGyayTSdOCoZ2DL490JhrxRCUQawbzosNiQ/GD7sM
         6KIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yJ6P/F1jFJr0lVYrdtAG0eMDCHBsrJpW/xU1AvPrpGs=;
        fh=pDsglMJuQskaY+Xc/MPkPzZSM+cKkJdwqbaFLfBO+uk=;
        b=S6O3UsilkEXhionS2N5U2pXOlL9GprpoedELiFNMRpHJgCXmvKsJqOX4KVmvOIlUz4
         xgNmt7suhKtMKFCkQVvShyeUgEAi4hGSh2NvN3wlFDavyl6k0fYmpH8/H9fyltxWhzy/
         78ylMg9W+wvtsE/fUMoFsfmAqp9hQht+IKSpgTMqWpLdXTtLYCK0vAxXcgmBwDNtR8D0
         sgQOMpV6j2GaPl/+l7K0/4a8ufcgBgq9ZDTBdf0OXcgiR7bb8ME/3R4qv17qAfQismDc
         sRJboQWXpkAao1FKvNadb06GMoo+ZzfO/9sAoMo/LJlYhdGCe2CJUmtwpnEhvAGUshEE
         Yx8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795336363; x=1795941163; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yJ6P/F1jFJr0lVYrdtAG0eMDCHBsrJpW/xU1AvPrpGs=;
        b=XB7NeBRY04euhXfWB/XxhB+DzTJzGlP9aMcTsxRixf44G2VojKxyLfPXDeVMXOFFTP
         J4DpFjZ7vFnnGEq5ETvtfFNcf4yjWA/tKzm6BKpfkJk1DMPKFI/e8Vcu5IiKbZWhUDRq
         4rIAr/b4CvqK5q1DHdNfGOQ6gZ46ae3x5Q6KYnbRoT/rKavQZE77Q/ZbXcmELdbQv/co
         IuqV2pxrKPabINQ3ndT0E3PPCa07d9/7iYw3mhuAOYldrIKh9xtwjLUDKVAo68JRPzs1
         5iUJaqhu2IsUisQZQ6FPqOAYMuD/9mx2P27dbuI7wSleqrbtVRyT8FmF7cXNmlLTS7Nu
         k/2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795336363; x=1795941163;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yJ6P/F1jFJr0lVYrdtAG0eMDCHBsrJpW/xU1AvPrpGs=;
        b=Ib1igl6ntGop98NVOr3oE1RyQ5kAuj3iQdjK5P5hE5/RE/jOmkH09YCkKBLc/O2n72
         9ycBAp94p7k3txsokoGs+7bPTyC5VbJvh/dK2iVHYQe2sBaEMmispG0xV/FHgrIu7erk
         JQ+YlLHsNtVjr59iqSmtG7/+NTD+tiCiDHHmMboCptzAx9Miko7qysp9o2qtWAzKuxCS
         gS+yHXJcSJ3d8OsyTku6fwFIzovyK69/CgpPB8BKQ0ObQEnLOrfcZ1HaLDxtktZ5Co1l
         VAo87SOSAr8OgbjB4b7SB7sn16+76nk2gQbNgF65w9sRBGJMrVyOh8QbO6c/33ijdhzx
         ecRg==
X-Gm-Message-State: APuU4Z83gLgPGWbpLsTfaE+2pG2lQMIzCCBMdEAijTNF+Wgy47n8UHCf
	JkKUu+DCybe804LrAnS7i93VEh87altIhzOwa1wm7VNHj2SzjTkDf+5nxX7M6Sz4owPWGzKmnUI
	RNuZ+rWcZWR3SFni6InugXWzRfCX2BgJPKPfqDxJHcA==
X-Gm-Gg: AZFdTZcnJZGW9TI++tcQZHs0oLDvnZwe7SXzY6TN0iCPL+HfbEzqeNhdUK7Ytr+5idJ
	VL0cTfPh7o2MUJEGELhtSc01Y7nVPKI7+Aa1jahQhLzf1KHC/rib4cAEqAn/7qOoRmJdVyfNgMV
	zdexTHZ+rH06uj0Ya6ebaCNBhTgN799OuWwG2GvAYDkQsRdYkzqNCrk4JWSwJcxyu7wYkULiY96
	QnVXbutmtDAd8jmQ5sG85cvzuIMNeeTEzJOXetkotTLikWTbHwC2eh+hTL6WEA1NEPdIUpe9sGK
	n/aK7c2spZlspom4CQPj6teXayaw9Sbag5rZIzxzn+3SxaRFo9x+FvXt3rG+GWZBRGzF44RehSl
	Wfr4WbEkjOVMSGb38ruVhz+VvNHWaBhn2Hn55AutNMuvMAabqPzdlwVMaZ6gIdYNBKgzcr47U
X-Received: by 2002:aa7:d58b:0:b0:6aa:e44a:ae9e with SMTP id
 4fb4d7f45d1cf-6ba1f76f20bmr5784629a12.1.1795336362700; Sun, 22 Nov 2026
 00:32:42 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118041238.14396-1-evostrov@amazon.com>
In-Reply-To: <20261118041238.14396-1-evostrov@amazon.com>
From: saeed bishara <saeed.bishara.os@gmail.com>
Date: Sun, 22 Nov 2026 10:32:31 +0200
X-Gm-Features: Aa3M54pZfE2KW1luQ6sOAJOOiUgk0uydYZlf6J4BSyxM_Kpl9YLALdVdQ9VZbPk
Message-ID: <CAHfVqdVw9OQ4OPmpLp4pJQhFw_9E7SLwNDjYXYuuGkU95=gGdg@mail.gmail.com>
Subject: Re: [RFC] net: ena: use tx-push-buf-len while tx-push is off
To: evostrov@amazon.com
Cc: netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, 
	David Arinzon <darinzon@amazon.com>, Shay Agroskin <shayagr@amazon.com>, 
	Arthur Kiyanovski <akiyano@amazon.com>, Gal Pressman <gal@nvidia.com>, 
	Michal Kubiak <michal.kubiak@intel.com>, Paolo Abeni <pabeni@redhat.com>, 
	Eric Dumazet <edumazet@google.com>, Kuniyuki Iwashima <kuniyu@amazon.com>, 
	Shai Brandes <shaibran@amazon.com>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> - We still need to tell the device how many header bytes to pull.
Just to be clear, the device eventually will read (pull) the entire packet
I think  tx-push-buf-len should have been called tx-inline-header-len,
as this is about how many bytes of the packet's header get written by
the driver into the Tx ring descriptor.
IMHO, we better introduce a new parameter, that is agnostic to
push/pull mode, we can choose to deprecate the current one in the long
term.

> - We want to use tx-push-buf-len for this, with tx-push off.
>
> ENA is the only in-tree driver that uses tx-push-buf-len, so this does
> not change any other driver.
>
> Example on a device that supports pull mode:
>
> ethtool -G <dev> tx-push off tx-push-buf-len 224
> ethtool -g <dev> -> TX Push: off, TX push buff len: 224
>
> The core already allows this. net/ethtool/rings.c checks only the
> capability bit and that the length is not above the max. It does not tie
> tx-push-buf-len to tx-push.
>
> In a 2023 review Gal Pressman suggested using tx-push-buf-len only when
> tx-push is on. That was never added as code or written as a rule.
> Link: https://lore.kernel.org/netdev/30cb3990-80ce-ca07-6d73-cdc00d0ad7b8@nvidia.com/
>
> Request: Please confirm this is fine or if not can you please suggest another
> way of achieving the pull mode len setup functionality.
>
> Thank you
>
