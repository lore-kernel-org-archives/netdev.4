Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=13.76.78.106
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795508844;
	b=5sl1fYwWEw6pi7iUWPMxd8iwLkr976vLsN8ZES+pijHOjjNhLChCAlvVBLYva2YMrK87
	 hx/Cjc23T0Lg6ccNC1U9bDgYYzt0TIkV39SfjpB4fXF6lJ4LexVZ2WjcWnSVY5A27kWMS
	 jeS7ZOkY3R6BWjunYPYz6XudCYt33tX6dRiDzpLNPiQIzugGWV6OZ8drZhf42sjDrg5Xz
	 wqUqX+y2q6sccG6xZmpk1bxAQy+HwqxI4EVaHUMueZvjwL1ou4skwPrPDiUf3SmMEmJLQ
	 1VD7ytZg8vvtAWRc4UmJjdcoWQHxPvHs5fUcqaxAMxxvIi/zexNhJVMDfdQVXolT6SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795508844;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=JTT3r5Nnkiq1Jzp6/EZE8sHsQcNwVpQs4cOU6x16a4A=;
	b=l20wRj2cRQgzLgV/lMxqG7a5BbSYk9krVpRJIwyrgQ2mGyjtlI6buEte/B++VrZ/MUBw
	 lN7fOHMVWEI1nZQsvX7VDsCtfIOUJJWoYQNl48GjMIdoUTjR0eHqd8qntAn+t8S/mvEBJ
	 CQpDcBK7HgSeMQvNTphp0ZxT9gbZGu+k2lwD96nvdwP6+rBR9HboxMOYOz7E1BX6tWOpN
	 rW7i7e9fJ+iRcUYNMG4GJgDQnsDWJiI9zgha59yUFS83ZaCeg+Zi8iFT2QxlD88T0n59x
	 CkMWZySVsE3Lz7ktTOrlhTClCS64paJmyXLFDGWWtRZsfO2UD/VATbKVsM553mGokPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.zgclab.edu.cn;
	spf=pass smtp.mailfrom=mail.zgclab.edu.cn;
	dkim=pass header.d=mail.zgclab.edu.cn header.i=@mail.zgclab.edu.cn header.a=rsa-sha256 header.s=dkim header.b=agx1LFbq;
	arc=none smtp.remote-ip=13.76.78.106
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.76.78.106])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F44C606A333;
	Tue, 24 Nov 2026 08:27:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F44C606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.zgclab.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.zgclab.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.zgclab.edu.cn header.i=@mail.zgclab.edu.cn header.a=rsa-sha256 header.s=dkim header.b=agx1LFbq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.zgclab.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	Content-Transfer-Encoding; bh=JTT3r5Nnkiq1Jzp6/EZE8sHsQcNwVpQs4c
	OU6x16a4A=; b=agx1LFbqwr5UXbFZNOwdR83BbT4yFqhD9Tqh4ghM6rt0mmFY4/
	09KB6Z8MRTQGED2GH2c+33unBi666/f5KGvGjYchYu0v5ri4D9Qtkura9IdcSuY+
	j7d0woEERwFPLwCP+EL5HyH93dMP9TDpsG/9uqM3x4cTJQmrk6cv8cNpU=
Received: from mt7530_series_03.eml (unknown [58.206.202.11])
	by web1 (Coremail) with SMTP id yAQGZQDXSTpaSgVrnee8Ag--.35646S2;
	Tue, 24 Nov 2026 16:27:07 +0800 (CST)
From: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
To: chester.a.unal@arinc9.com, daniel@makrotopia.org, andrew@lunn.ch, olteanv@gmail.com
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH net 3/5] net: dsa: mt7530: register the GPIO controller last in setup
Date: Tue, 24 Nov 2026 16:25:57 +0800
Message-ID: <179550875790.4156.7464757884919680732@mail.zgclab.edu.cn>
In-Reply-To: <179550875789.4156.361477684651496992@mail.zgclab.edu.cn>
References: <179550875789.4156.361477684651496992@mail.zgclab.edu.cn>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:yAQGZQDXSTpaSgVrnee8Ag--.35646S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw4rtr1xJr47KFy8Aw15XFb_yoW8GFW7pF
	WUZa42g34DtF45G3WkAw48Zas8tFyxGFy7A397Z390yw1avrWUKrW5KFyF9F1UGFWfGa1S
	yF4fAFW3ZFsrXaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBCb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
	vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE
	52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXV
	WUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48J
	M4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxkIecxEwVAFwVW8Zw
	CF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j
	6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64
	vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42
	IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUgXo2DUUUU
X-CM-SenderInfo: pzdqwxbusqjlo62juzldeovvfxof0/1tbiAgQBD2sFSC8EngAAsb

mt7530_setup_gpio() publishes a GPIO controller that userspace and other
drivers can use immediately, but it currently runs before the FDB flush,
which is the last step of setup that can fail.

Move the GPIO controller registration after the FDB flush so that the
controller is only made visible once every fallible step, including the
FDB flush, has succeeded. This becomes important in the next patch, where
the failure paths disable the regulators and return an error, so the
controller must not be registered across a failed setup.

Signed-off-by: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
---
 drivers/net/dsa/mt7530.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index eb55cc969f43..e208d942b577 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2585,6 +2585,11 @@ mt7530_setup(struct dsa_switch *ds)
 		}
 	}
 
+	/* Flush the FDB table */
+	ret = mt7530_fdb_cmd(priv, MT7530_FDB_FLUSH, NULL);
+	if (ret < 0)
+		return ret;
+
 #ifdef CONFIG_GPIOLIB
 	if (of_property_read_bool(priv->dev->of_node, "gpio-controller")) {
 		ret = mt7530_setup_gpio(priv);
@@ -2593,11 +2598,6 @@ mt7530_setup(struct dsa_switch *ds)
 	}
 #endif /* CONFIG_GPIOLIB */
 
-	/* Flush the FDB table */
-	ret = mt7530_fdb_cmd(priv, MT7530_FDB_FLUSH, NULL);
-	if (ret < 0)
-		return ret;
-
 	return 0;
 }
 

