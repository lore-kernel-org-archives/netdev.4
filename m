Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795549214;
	b=eOBp7wU1PPNUWyU+nxRxVk5M8y33pmci7qr1UMqZCE6C2ZGRaqTaLSNffXR9x8VaUiry
	 Uww9Eo1+cSIZ6DrDlNsK8K8wZGNLp/V1kzzeUZD5BSTUvIugBgS+WI/qsef3P6Oy+Lu4N
	 MqESy9O8pYCcV8Jv9fVO9fkQBhvi8jAYmqhpHdnpBpBjwABc6Y2Tu19Nwz4E2IvW5yclV
	 VeXEjibh5nxBX+oR4AEF8NWtg94IjJXGts6cGony6mZqNO6MbUxpRQI8++m7vD89aKT1n
	 vAK0ucIYduQBUWiTIOpjGbR6xU8I/V3t+qR2+wjMtZEAHYEe+F1c325C7clEaG6miNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795549214;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Transfer-Encoding:MIME-Version:Content-Type;
	bh=0Pk7VcO6MHtXoThdYzAiD55vUiySd54g9n6hkzZ6Qy0=;
	b=065IZEj1pymwnT58eh+wLQntJ30kSDAGjALeHklGoD9JaEaPdX6fvgHKsPktOL609r9T
	 7tGSomPAGm9PowZGh1TyZDNaOy/47ete19pI0spONepfJklxpAAiqMf75qF2OwwTo4bSD
	 KZAIQ9UdPY0DBk489JS53SOE6LtB5DJwZqqKRDxbXgENM/g5GzfV3sorLhIn0VwVHet3/
	 Y/8xBL9klAzgOBObIpPPltAw5K5kS8GSkEyc/QRQ7mYLL4Wl+sAEaqInQCqKxaBiEjqsZ
	 rbC8jaUb0XtBzkOdpfGzMRIcuNQyBwpHiVYqu80E3ZJR2NhFT4T4j6mlD2nF8wNh7eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NP5r8GlT;
	arc=none smtp.remote-ip=209.85.208.178
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C031B606A695
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 19:40:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C031B606A695
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NP5r8GlT
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3ae81ae52ffso35515831fa.2
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 11:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795549206; x=1796154006; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Pk7VcO6MHtXoThdYzAiD55vUiySd54g9n6hkzZ6Qy0=;
        b=NP5r8GlTST92ylX8PKG2Pd/emE5hCFhCa3yQgXw/67l48b+J/VMF6p70IdWMS4Oc2s
         eJluY+kIkDRgTN/MCm8X2X6QY+cUN3p1WgIRcf3XvrFVPXZ67rBiYiPaUw8A6rYPZK0N
         omxUYbZlpm7nd3ydpAOLqfQpe/5d9ce0+Rj+LCA+5JYnpap9HPKVWihFy7+jZMWecdkB
         NDopGqMopiZTN4x6q07tLX+cRkUwLqV40kF5OsoBBwbdil0U5IUoiMbEEY4gasRmN6HU
         HxTKWV2DDhEvQKlTkzgFmPS2LRvB9WT3V49ylWky5Pb0DydeXjtu7HDkPfNFBPhGFVYw
         cB+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795549206; x=1796154006;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Pk7VcO6MHtXoThdYzAiD55vUiySd54g9n6hkzZ6Qy0=;
        b=mKOaZtgubHRZERD48DF4vnEG9SnAGlcyHU0Dbr7lt79u1Po9fzYFhgi24rsugAReK9
         m9BfyvulWnkMNCGOn4veyYca5MTt8mQ33NDmfso5o0G8welom4XvwL2sMi3pe7Mwvelb
         S6OLSGbpcsSt7G5QzqsxjqpfG4CvJgIfDhWU4iQ788YzDO6GbFfWWicxvZuyMNNoQeDC
         6WVYvxWYfmg+nXFQIQyKbGzPJzmMzjKz/MyX7wTOHrwTS+IDqos907hN7djP4AZTw4M4
         CEkQDZSHPsvo0SXMIwb5LKrRQ758TtmKO/eLm/n32X6Yqa4z9Np6iqjYXChko0Gnlx/o
         gguQ==
X-Forwarded-Encrypted: i=1; AL+hErHxBnYp/7X7N0HGlYq/NDdjekdm25aTBc2sZ7tNLcBB8KEXZlZZ+mlZ/LXBBwmjzPr1VK58H6A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WrerkaFvE3YDfSBjnr8j3D1Ty1Dagw9A1pekWzP30fOfejREm
	pXgrScx5UC9+XF+Lv893dKYGuUUb1MWQlZFW8kpNAQlCTNYIYZfWjAILUErif/N0dR4=
X-Gm-Gg: AZFdTZerSOb5VNA7y9ghKt61rWU6UEjMVn38uwKNltshDOkIFgpQBAiddkIjD11Wnl/
	H4BKkyiQbc+Vu8QN5gRTvQqcOsFsjAFakN0qsDQkSsOfVjKsK7Uwy/n31M1fv3ufbYMX+l00n0Y
	ibQupH8SJXDlD2kqeUvQ/WY9Ko1jMGvG8981AbgtOoLUHk/OKfwzLMhfTSOoSXewIiPc4ITDVKy
	hRcq8OkGinJ9EtksS3aznRkDxR9lJrL1B7z+isTbAcZPAsu5znAUJmoGSQlsCsfHr7+e19fBCWp
	eMHU1aSJo1AAwYhnHPpeR2knQxikIQQOGErLBQSeWbi0bXtG7T/ZQS7YGGVtNqIoAhHi2IAZmuJ
	tJIKdApLpxZRjaFclkKuXkUhYWoFg0Udv+lKEhuN85RuzfEIR4z9nC+K39SdID6F1BPliF5jGOE
	3ITWhfbjEMKsHIgMZtKrVtZF/X4e251Opa3F2V2k6OCbmVQ+9Y8Zr5yApQ0vRsUsSFzXI6n9J3Q
	663tRY33qr7StKrtQ7qEeYnmY6VVr98l2q7aUDONoEMe8MmCtmdLVnsVdE6EFIg+A0vNI550HhB
	U/+Z5I9vWyt4GYtDriqBHBy+wA/lZjKBM1z9zCuNcPf8szmVIWF2boU=
X-Received: by 2002:a05:6512:318e:b0:5c1:5a83:4285 with SMTP id 2adb3069b0e04-5c1bc89ad5emr5211802e87.60.1795549205624;
        Tue, 24 Nov 2026 11:40:05 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd043387sm4051662e87.49.2026.11.24.11.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 11:40:05 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev-bot+sashiko@kernel.org, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, hkallweit1@gmail.com, linux@armlinux.org.uk,
 andrew+netdev@lunn.ch, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH net-next 1/3] dt-bindings: net: Add Cortina CS7542 MDIO controller
In-Reply-To: <22c76d61-d604-445a-9aba-f52e19f93ccb@lunn.ch>
References: <20261123-b4-cs7542-mdio-v1-1-626d0a0e3b4d@gmail.com>
 <179554724588.3135.13754934088283070222@kernel.org>
 <22c76d61-d604-445a-9aba-f52e19f93ccb@lunn.ch>
Date: Tue, 24 Nov 2026 22:39:44 +0300
Message-ID: <179554918420.4.6608826251937872544@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

Hi Andrew,

I agree about describing the input clock before the binding is merged.
The vendor U-Boot sets bit 5 of the MDC prescaler, and the kernel SDK
writes 0x20 to that field. Neither source identifies the clock feeding
it. I have not found a CS7542 clock diagram that ties it to the APB
clock, so I am checking that connection before adding the phandle to the
SoC .dtsi.

The U-Boot and SDK sites I checked are below.

https://github.com/futuretekinc/cortina/blob/aafa3821f0934eebe8137726d4e6d5994c1ac3fa/u-boot/drivers/net/g2_ni_mfe.c#L724-L727
https://github.com/drvlabo/linux_kernel_cs75xx/blob/8bb3f7dc796a59d992572a118448ba196f547ed6/drivers/net/ethernet/cs752x/src/ni/cs752x_eth.c#L3529-L3534

Thanks,
Fil

